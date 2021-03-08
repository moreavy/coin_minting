local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname).."/"
coin_minting = {}

function table.map(tab, func)
    local mapped = {}
    for i, value in ipairs(tab) do
        mapped[i] = func(value)
    end
    return mapped
end
  

minetest.register_tool(modname..":hammer", {
    description = "Minting Hammer",
    inventory_image = "coin_minting_hammer.png",
    tool_capabilities = {
        full_punch_interval = 1,
        max_drop_level = 1,
        groupcaps = {
            mold = {
                maxlevel = 2,
                uses = 50,
                times = { [1]=2.60, [2]=3.20, [3]=0.80 },
            },

            cracky = {
                maxlevel = 2,
                uses = 50,
                times = { [1]=2.60, [2]=3.20, [3]=0.80 },
            },
        },

        damage_groups = {snappy = 1},
    },
})

function coin_minting.register_coin(properties)
    minetest.register_craftitem(modname..":coin_"..properties.name, {
        description = properties.description,
        inventory_image = properties.img_file_path,
    })

    minetest.register_on_dignode(function(pos, oldnode, digger)
        if oldnode.name == modname..":".."mold_"..properties.mold_name then
            local InvRef = digger:get_inventory()
            InvRef:add_item("main",modname..":coin_"..properties.name)
            InvRef:remove_item("main", modname..":".."mold_"..properties.mold_name)
        end
    end)
end

function coin_minting.register_mold(properties)
    minetest.register_node(modname..":mold_"..properties.name, {
        description = properties.description,
        tiles = properties.images,
        groups = {mold = 1},
    })

    minetest.register_craft({
        output = modname..":mold_"..properties.name,
        recipe = properties.crafting_recipe
    })
end

dofile(modpath.."main.lua")
