-- ================================
-- Keymaps Configuration
-- ================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear search highlighting
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Save file
keymap("n", "<C-s>", ":w<CR>", opts)

-- Quit
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":qa!<CR>", opts)

-- DevSecOps specific keymaps
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostic" })
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })

-- Terminal
keymap("n", "<leader>tt", ":split | terminal<CR>", { desc = "Terminal split" })
keymap("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "Terminal vsplit" })
keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Exit terminal mode

-- File explorer
keymap("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buffers" })
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<leader>fc", ":Telescope git_commits<CR>", { desc = "Git commits" })
keymap("n", "<leader>fs", ":Telescope git_status<CR>", { desc = "Git status" })

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References" })
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Implementation" })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Format" })

-- Git
keymap("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Git branches" })
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", { desc = "Git commits" })

-- Docker
keymap("n", "<leader>dp", ":!docker ps<CR>", { desc = "Docker ps" })
keymap("n", "<leader>di", ":!docker images<CR>", { desc = "Docker images" })

-- Kubernetes
keymap("n", "<leader>kp", ":!kubectl get pods<CR>", { desc = "K8s get pods" })
keymap("n", "<leader>ks", ":!kubectl get svc<CR>", { desc = "K8s get services" })

-- Terraform
keymap("n", "<leader>tf", ":!terraform fmt<CR>", { desc = "Terraform format" })
keymap("n", "<leader>tv", ":!terraform validate<CR>", { desc = "Terraform validate" })

-- Security scanning
keymap("n", "<leader>st", ":!trivy fs .<CR>", { desc = "Trivy scan" })
keymap("n", "<leader>sg", ":!gitleaks detect -v<CR>", { desc = "Gitleaks scan" })
