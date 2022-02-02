local status_ok, code_action_menu = pcall(require, 'weilbith/nvim-code-action-menu')
if not status_ok then
  return
end

code_action_menu.setup()
