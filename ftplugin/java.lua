local config = {
    cmd = {'/home/toan/Downloads/jdt-language-server-1.31.0-202401111522/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
