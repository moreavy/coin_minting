coin_minting.register_mold({
    name = "gold_coin",
    description = "Gold Coin Mold",
    images = {"coin_minting_mold_gold_coin.png"},
    crafting_recipe = {
        {"default:stone","default:stone","default:stone"},
        {"default:stone","default:gold_ingot","default:stone"},
        {"default:stone","default:stone","default:stone"},
    },
})

coin_minting.register_coin({
    name = "gold_coin",
    description = "Gold Coin",
    img_file_path = "coin_minting_gold_coin.png",
    mold_name = "gold_coin",
})


coin_minting.register_mold({
    name = "basic_coin",
    description = "Coin Mold",
    images = {"coin_minting_basic_mold.png"},
    crafting_recipe = {
        {"default:stone","default:stone","default:stone"},
        {"default:stone","default:steel_ingot","default:stone"},
        {"default:stone","default:stone","default:stone"},
    },
})

coin_minting.register_coin({
    name = "basic_coin",
    description = "Coin",
    img_file_path = "coin_minting_coin.png",
    mold_name = "basic_coin",
})
