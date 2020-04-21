# admin dialog
this page allows you to understand how the administrator menu works

## filles list
- "file 1" main configurations : "config/config_admin.lua"
- "file 2" function call by adminisrateur : "admin/function/*_function.lua"
- "file 3" function call by id on dialog : "admin/dialog/filter_admin_ui.lua"

## dialog list "file 1"
this table is made up of two sub-tables, the first 'drop_down' allows adding parent menu allowing more multiple submenu. the second 'section' allows you to add a function to the navigations.

### table drop_down
allows to add a parent menu.
```lua 
    drop_down = {
        id = "dysplay name",
    };
```
#### Parameters
- id : the parent menu id which will be useful for adding a feature to it
- dysplay name : the text that will be displayed in game


### table section
allows to add a functionality

```lua 
exemple_func = {
    name = "exemple func",
    level = 1,
    drop_down_id = "exempleFunc",
    form = {
        {type = "vehicles", id = "car_id", custom = "", name = "cars"},
    }
};
```
#### Parameters
- exemple_func : the feature id
- name : the text that will be displayed in game
- level : the administrator levels necessary to have this functionality
- drop_down_id = parent menu id 'table drop_down'
- form : the form to display for this functionality

#### Form
WIP
