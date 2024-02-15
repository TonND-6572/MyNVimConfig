return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python"
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
    require('dap-python').setup('~/Downloads/programs/miniconda3/bin/python3.11')
    require('dapui').setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dc", dap.continue, {})
		vim.keymap.set("n", "<leader>dso", dap.step_over, {})
		vim.keymap.set("n", "<leader>dsi", dap.step_into, {})
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint, {})
	end,
}
