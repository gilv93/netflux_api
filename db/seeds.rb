# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def inner_response(id)
    response = RestClient.get "https://api.themoviedb.org/3/movie/#{id}/videos?api_key=d5ba9815eee72ec8ecb7839af9af7ad6&language=en-US"
    json = JSON.parse response

    if !json.nil?
        begin
            vid_key = json["results"][0]["key"]
        rescue => exception
            nil
        end
    else
        puts "video key not obtained"
    end
end

def movies

    Movie.destroy_all

    response1 = RestClient.get "https://api.themoviedb.org/3/movie/popular?api_key=d5ba9815eee72ec8ecb7839af9af7ad6&language=en-US&page=1"
    json1 = JSON.parse response1

    response2 = RestClient.get "https://api.themoviedb.org/3/movie/top_rated?api_key=d5ba9815eee72ec8ecb7839af9af7ad6&language=en-US&page=1"
    json2 = JSON.parse response2

    response3 = RestClient.get "https://api.themoviedb.org/3/movie/upcoming?api_key=d5ba9815eee72ec8ecb7839af9af7ad6&language=en-US&page=1"
    json3 = JSON.parse response3

    if !json1.nil?
        json1["results"].map do |movie|
            # inner_response = RestClient.get "https://api.themoviedb.org/3/movie/#{movie["id"]}/videos?api_key=d5ba9815eee72ec8ecb7839af9af7ad6&language=en-US"
            # json2 = JSON.parse inner_response

            # vid_key = json2["results"][0]["key"]

            vid_key = inner_response(movie["id"])

            Movie.create(
                title: "#{movie["title"]}",
                overview: "#{movie["overview"]}",
                image: "#{movie["poster_path"]}",
                backdrop: "#{movie["backdrop_path"]}",
                alt_id: "#{movie["id"]}",
                video: "#{vid_key}",
                category: "popular"
            )
        end
    else
        puts "error seeding"
    end

    if !json2.nil?
        json2["results"].map do |movie|
            # inner_response = RestClient.get "https://api.themoviedb.org/3/movie/#{movie["id"]}/videos?api_key=d5ba9815eee72ec8ecb7839af9af7ad6&language=en-US"
            # json2 = JSON.parse inner_response

            # vid_key = json2["results"][0]["key"]

            vid_key = inner_response(movie["id"])

            Movie.create(
                title: "#{movie["title"]}",
                overview: "#{movie["overview"]}",
                image: "#{movie["poster_path"]}",
                backdrop: "#{movie["backdrop_path"]}",
                alt_id: "#{movie["id"]}",
                video: "#{vid_key}",
                category: "top_rated"
            )
        end
    else
        puts "error seeding"
    end

    if !json3.nil?
        json3["results"].map do |movie|
            # inner_response = RestClient.get "https://api.themoviedb.org/3/movie/#{movie["id"]}/videos?api_key=d5ba9815eee72ec8ecb7839af9af7ad6&language=en-US"
            # json2 = JSON.parse inner_response

            # vid_key = json2["results"][0]["key"]

            vid_key = inner_response(movie["id"])

            Movie.create(
                title: "#{movie["title"]}",
                overview: "#{movie["overview"]}",
                image: "#{movie["poster_path"]}",
                backdrop: "#{movie["backdrop_path"]}",
                alt_id: "#{movie["id"]}",
                video: "#{vid_key}",
                category: "upcoming"
            )
        end
    else
        puts "error seeding"
    end
end

movies

puts "finished seeding"