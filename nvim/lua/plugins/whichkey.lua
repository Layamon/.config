local which = require("which-key")
which.setup({
	spelling = {
		enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
		suggestions = 20, -- how many suggestions should be shown in the list?
	},
})
