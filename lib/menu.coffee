class Menu

  @localize: ->
    CSON = require 'cson'
    defM = CSON.load __dirname + "/../def/menu_#{process.platform}.cson"
    @updateMenu(atom.menu.template, defM.Menu)
    atom.menu.update()

  @updateMenu: (menuList, def) ->
    return if not def
    for menu in menuList
      continue if not menu.label
      key = menu.label
      set = def[key]
      continue if not set
      menu.label = set.value if set?
      if menu.submenu?
        @updateMenu(menu.submenu, set.submenu)

module.exports = Menu
