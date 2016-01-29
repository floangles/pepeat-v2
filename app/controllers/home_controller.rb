class HomeController < ApplicationController
  def index
    @meals = Meal.all
    @order = Order.new
    # @graph = Koala::Facebook::API.new("CAACEdEose0cBAIXCWMG03CJfUVrCnv2NLkq39OfEr4foXoteal6BBxJaeYZAlyT8jkzQ8bhsMSWmj2CF5qAIdzpIZCaZCjbZBt78V33aTL4UmyjZAaSisl4ag9GfVwOvuNfsJPuuqaaG6msQOT3qt56U6ZAyO79ZAepRgpo3ZA5xQYEeuVl63B7dXARYLIa1nVW7fogvZAaocWAZDZD")
    # groups = @graph.get_connections("me", "groups")

    # pepeat_group = groups.select do |group|
    #   group["name"] == "Les putes de l'Est !"
    # end

    # @graph.put_connections(pepeat_group[0]['id'], "feed",{ message: "Ca va cartonner"})
    # @graph.put_connections(pepeat_group[0]['id'], "feed", {
    #   message: "test lien",
    #   # link: "https://www.pepeat.org/meals/12",
    #   current_user.picture.url(:large) => true
    # })


    # @graph.put_picture(current_user.picture.url(:medium), {message: "#{current_user.firstname} a proposé un menu. www.pepeat.org"}, pepeat_group[0]['id'])
    # @graph.put_picture(current_user.picture.url(:medium), {}, pepeat_group[0]['id'])

  end
end
