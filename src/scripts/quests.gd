extends Node

var prompt_dialog = ['Bark Bark! Bark Bark Bark. (The dog appears to be cold)', 
'Excuse me, dearie, I have a bit of a problem. You see, my garden is quite far from the well, and I can\'t carry the water all the way there without getting tired. Do you have anything that could help me?', 
'Hello, excuse me, I was wondering if you could help me with something. I run the butcher shop down the street, and I\'m having trouble with my meats spoiling too quickly. Is there anything you can do to help me? I knew your grandfather when he ran this shop and he was always coming up with solutions to help me improve my business.',
'Woah this place is so retro, do people actually buy stuff here? Rune magic is so outdated nowadays.']

var success_dialog = ['Bark! Bark! Bark! (The dog drops two coins on the floor and prances out)', 
'Oh my! This is just the thing I needed. Bless your kind heart, dearie. Thank you so much.', 
'This is exactly what I was looking for! Thank you so much, I\'ll be sure to recommend your store to my customers.',
'done d']
var partial_dialog = ['Bark! (The dog drops a coin and walks out)', 
'Thank you dearie, this will do.', 
'Thank you, this should work just fine.',
'partial d']
var failure_dialog = ['Bark...', 
'Well I can certainly try to use this...', 
'Hmm, I don\'t think this is going to work for me.',
'Oh, my friend just wanted me to check out this place. Are you in the college?']

var correct_response = ["Fire Low Intensity", "second", "third", "fourth"]
var partial_response = ["Fire", 'second_p', 'third_p', 'fourth_p']

var job_desc = ['A dog came wandered into your shop looking a little chilly. Maybe you could make a rune to warm it up?', 'A lady came into your shop asking for watering can that does not get too heavy.', 'A butcher is looking for a rune to prevent his meats from spoiling.', 'What did she even want?']
