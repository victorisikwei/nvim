# To set up Exim on your VPS to send email via Office 365 SMTP, you need to configure it to relay emails through Office 365. Below are the steps to achieve this:

---

[go to note file](notes.md)
[go to google.com](https://www.google.com) 

### 1. **Install Exim**
If Exim is not already installed, install it using your package manager:

```bash
sudo apt update
sudo apt install exim4
```

---

### 2. **Set Exim to Split Configuration (Optional)**
If your Exim installation is using a single configuration file and you'd prefer a modular setup:

```bash
sudo dpkg-reconfigure exim4-config
```

Choose the **split configuration** option when prompted.

---

### 3. **Edit Configuration**
Locate the configuration directory or file depending on your setup:

- Split configuration: Files are in `/etc/exim4/conf.d/`.
- Single configuration: Use `/etc/exim4/exim4.conf.template`.

---

#### a. Update Exim to Relay via Office 365
Edit or create the file `/etc/exim4/passwd.client` (for authentication details):

```bash
sudo nano /etc/exim4/passwd.client
```

Add the following line:

```
*.outlook.com:your-email@yourdomain.com:your-office365-password
smtp.office365.com:your-email@yourdomain.com:your-office365-password
```

Replace:
- `your-email@yourdomain.com` with your Office 365 email address.
- `your-office365-password` with the email account's password or app password (if MFA is enabled).

---

#### b. Modify the SMTP Configuration
Edit the configuration file `/etc/exim4/update-exim4.conf.conf`:

```bash
sudo nano /etc/exim4/update-exim4.conf.conf
```

Set these values:

```
dc_eximconfig_configtype='satellite'
dc_other_hostnames=''
dc_smarthost='smtp.office365.com::587'
dc_readhost='yourdomain.com'
dc_hide_mailname='true'
dc_local_interfaces='127.0.0.1'
```

Replace `yourdomain.com` with your domain.

---

#### c. Enable TLS
Ensure Exim uses TLS for secure communication. Add or modify the following in the relevant configuration files (split or single):

For split configuration, add this snippet to a transport configuration file, e.g., `/etc/exim4/conf.d/transport/30_exim4-config_remote_smtp`:

```bash
remote_smtp:
  driver = smtp
  port = 587
  hosts_require_tls = smtp.office365.com
```

---

### 4. **Update Configuration**
After editing, update and restart Exim:

```bash
sudo update-exim4.conf
sudo systemctl restart exim4
```

---

### 5. **Test the Configuration**
Send a test email:

```bash
echo "This is a test email" | mail -s "Test Email" recipient@example.com
```

Replace `recipient@example.com` with a valid email address.

---

### 6. **Troubleshooting**
- Check logs for errors:
  ```bash
  sudo tail -f /var/log/exim4/mainlog
  ```
- Verify DNS records (SPF, DKIM, DMARC) for your domain are set up correctly to avoid emails being flagged as spam.

---

Let me know if you encounter any issues! 😊
