# get '/' do
#     File.read(File.join('app/views','index.html'))
# end

def humanized_time_ago(time_ago_in_minutes)
    if time_ago_in_minutes >= 60
        "#{time_ago_in_minutes / 60} hours ago"
    else
        "#{time_ago_in_minutes} hours ago"
    end
end

get '/' do
    finstagram_post_shark = {
      username: "sharly_j",
      avatar_url: "http://naserca.com/images/sharky_j.jpg",
      photo_url: "http://naserca.com/images/shark.jpg",
      humanized_time_ago: humanized_time_ago(15),
      like_count: 0,
      comment_count: 1,
      comments: [{
          username:"sharky_j",
          text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
      }]
    }

    finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
    photo_url: "http://naserca.com/images/whale.jpg",
    humanized_time_ago: humanized_time_ago(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
    }

    finstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
    photo_url: "http://naserca.com/images/marlin.jpg",
    humanized_time_ago: humanized_time_ago(190),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)"
    }]

  }

# time_ago = humanized_time_ago(finstagram_post[:time_ago_in_minutes])

    # # if the time_ago_in_minutes is greater than 60
    # if time_ago_in_minutes >= 60

    #      # return this string
    #     "#{time_ago_in_minutes/60} hours ago"

    # # if it's less than or equal    
    # else

    #     # return this instead
    #     "#{time_ago_in_minutes} minutes ago"
    # end
[finstagram_post_shark, finstagram_post_whale, finstagram_post_marlin].to_s
end