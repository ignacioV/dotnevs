local M = {};

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local base_workspaces_path = vim.fn.expand("~/dev/jdtls/")

local workspace_dir = base_workspaces_path .. project_name

vim.notify("DEBUG: jdtls_conf setting workspace_dir: " .. workspace_dir)

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
--
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    "/usr/lib/jvm/java-17-openjdk-amd64/bin/java",
    --'java', "/usr/lib/jvm/java-17-openjdk-amd64/bin/java",
    -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    "-javaagent:" .. vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/lombok.jar"),
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    -- CHANGED: mason plugins org.eclipse.equinox.launcher_ ... stuff jar
    '-jar',
    vim.fn.glob(vim.fn.expand("~") .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    -- '-jar', '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    -- CHANGED: mason jdtls config
    '-configuration',
    vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/config_linux"),
    -- '-configuration', '/path/to/jdtls_install_location/config_SYSTEM',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- CHANGED: workspace dir??
    -- See `data directory configuration` section in the README
    '-data',
    workspace_dir
  },

    -- 💀
  -- CHANGED: root dir of the project
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  root_dir = require('jdtls.setup').find_root({'.git', 'pom.xml'}),
  capabilities = require("ignacio.lsp.handlers").capabilities,
  --contentProvider = { preferred = "fernflower" },
  on_attach = require("ignacio.lsp.handlers").on_attach,
  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
      java = {
          configuration = {
              -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
              -- And search for `interface RuntimeOption`
              -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
              runtimes = {
                  {
                      name = "JavaSE-1.8",
                      path = "/usr/lib/jvm/bellsoft-java8-full-amd64",
                  },
              }
          },
          maven = {
              downloadSources = true,
          },
          sources = {
              organizeImports = {
                  starThreshold = 9999,
                  staticStarThreshold = 9999,
              },
          },
      },
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
      extendedClientCapabilities = extendedClientCapabilities,
      bundles = {},
  },
}

M.get_config = function ()
   return config
end
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
--require('jdtls').start_or_attach(config)
return M;
