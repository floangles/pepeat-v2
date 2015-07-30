# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Meal.create(starter: 'Mousse à la groseille', main: 'hamburger au barbecul', dessert: 'Trifle aux framboises', portion: '20', price: '10', description: 'par Ester (blog "Ester Kitchen") Universelle, elle plaît à tous et se plie aux goûts et aux fantaisies de chacun. 5 variations sur le même thème pour dévorer tout l’été la salade de pommes de terre sans jamais se lasser.
A tout seigneur, tout honneur ! En France, et plus particulièrement en Alsace, la salade de pommes de terre s’entend bien vinaigrée. Chaque famille a sa recette de « grumbeere salat » (de « grum » la terre et « beere » la baie), car la pomme de terre était consommée en Alsace dès le milieu du XVIème siècle, soit bien avant le reste de la France.

Elle peut être tiède et faite avec des œufs durs ou mollets, ou bien enrichie de lardons, de cervelas, ou de façon moins traditionnelle de morceaux de knacks. L’important : le vinaigre, qu’il soit de cidre, ou du Melfor, le vinaigre alsacien au miel et aux plantes au goût unique.
On trouve de l’autre côté du Rhin des salades de pommes de terre allemandes (dites « Kartoffelsalat ») qui sont leurs proches cousines.', day: ' Fri, 14 Aug 2015 00:00:00 UTC +00:00', start_hour: 'Thu, 30 Jul 2015 19:10:00 UTC +00:00' ,end_hour:'Thu, 30 Jul 2015 21:10:00 UTC +00:00')


MealPicture.create(meal_id: '1', picture_file_name: "dessert.jpg", picture_content_type: "image/jpeg", )
MealPicture.create(meal_id: '1', picture_file_name: "main.jpg", picture_content_type: "image/jpeg",)
MealPicture.create(meal_id: '1', picture_file_name: "starter.jpg", picture_content_type: "image/jpeg",)
