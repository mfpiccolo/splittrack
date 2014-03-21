
App.MenuItem = Ember.View.extend
  templateName: "comps/menu_item"
  tagName: 'a'
  classNames: ["button"]
  attributeBindings: ['href', 'hidden']
  hidden: "hidden"

