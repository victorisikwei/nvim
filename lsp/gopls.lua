return {
    cmd = { "gopls" },
    filetypes = { "go" },
    root_markers = { ".go" },
    settings = {
        Go = {
            runtime = {
                version = '*'
            }
        }
    }
}
