# kman-dice
Simple dice script for Fivem and ox_inventory

Dice script that has 5 different colored dice items. 
Use the dice item to roll 2, 6 sided dice or right click to have the option to roll 1 or 3 dice.

**PREVIEW:** https://streamable.com/3r67pp

## Installation
1. Add the folder to your resource folder and ensure it in your server's config
2. 2.Copy and paste the following lines into your items.lua
```lua
["dice_b"] = {
		label = "Dice",
		weight = 400,
		stack = false,
		description = "For all your... board game needs",
		client = {
			image = "dice_b.png",
			export = "kman-dice.diceRoll2",
		},
		buttons = {
			{
				label = 'Roll 1',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll1("", {name = "dice_b"})
				end
			},
			{
				label = 'Roll 3',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll3("", {name = "dice_b"})
				end
			},
		}
	},
	["dice_r"] = {
		label = "Dice",
		weight = 400,
		stack = false,
		description = "For all your... board game needs",
		client = {
			image = "dice_r.png",
			export = "kman-dice.diceRoll2",
		},
		buttons = {
			{
				label = 'Roll 1',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll1("", {name = "dice_r"})
				end
			},
			{
				label = 'Roll 3',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll3("", {name = "dice_r"})
				end
			},
		}
	},
	["dice_g"] = {
		label = "Dice",
		weight = 400,
		stack = false,
		description = "For all your... board game needs",
		client = {
			image = "dice_g.png",
			export = "kman-dice.diceRoll2",
		},
		buttons = {
			{
				label = 'Roll 1',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll1("", {name = "dice_g"})
				end
			},
			{
				label = 'Roll 3',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll3("", {name = "dice_g"})
				end
			},
		}
	},
	["dice_y"] = {
		label = "Dice",
		weight = 400,
		stack = false,
		description = "For all your... board game needs",
		client = {
			image = "dice_y.png",
			export = "kman-dice.diceRoll2",
		},
		buttons = {
			{
				label = 'Roll 1',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll1("", {name = "dice_y"})
				end
			},
			{
				label = 'Roll 3',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll3("", {name = "dice_y"})
				end
			},
		}
	},
	["dice_w"] = {
		label = "Dice",
		weight = 400,
		stack = false,
		description = "For all your... board game needs",
		client = {
			image = "dice_w.png",
			export = "kman-dice.diceRoll2",
		},
		buttons = {
			{
				label = 'Roll 1',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll1("", {name = "dice_w"})
				end
			},
			{
				label = 'Roll 3',
				group = "More", 
				action = function(slot)
					exports['kman-dice']:diceRoll3("", {name = "dice_w"})
				end
			},
		}
	},
  ```
  3. Add the png files from the images folder to ox_inventory>web>images
  4. If you want you can paste the following code into ox_inventory>data>shops.lua if you want to have a store that sells the items
  ```lua
  Dice = {
		name = 'Dice Shop',
		blip = {
			id = 439, colour = 28, scale = 0.6
		}, inventory = {
			{ name = 'dice_b', price = 100 },
			{ name = 'dice_r', price = 100 },
			{ name = 'dice_g', price = 100 },
			{ name = 'dice_y', price = 100 },
			{ name = 'dice_w', price = 100 }
		}, locations = {
			vector3(-147.64, 229.54, 94.93)
		}, 
	},
  ```
  
  
  
