
get '/' do
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    erb(:index)

end

get '/signup' do        #if a user navigates to the path "/signup",
    @user = User.new    #setup empty @user object
    erb(:signup)        #render "app/views/signup.erb"
end

post '/signup' do
    
  #grab user input values from params
  email       = params[:email]
  avatar_url  = params[:avatar_url]
  username    = params[:username]
  password    = params[:password]

  
  #instantiate and save an User
  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password:password })  

    #if user validations pass and user is saved
    if @user.save
        "User #{usernaname} saved!"
      
    else
      erb(:signup)
    end

end

get '/login' do        #when a GET request comes into "/login",
    erb(:login)        #render "app/views/login.erb"
end

post 'login' do     #when we submit a form with an action of /login
    username = params[:username]
    password = params[:password]
    
    # 1. find user by username
    user = User.find_by(username: username)

    # 2. If that user exists
    
    if user

        # check if that user's password matches the password input
        # 3. if the passwords match
        if user.password == password

            #login (more to come here)
            "Success!"
        else
            "Password doen't match"
        end

    else
        "No user"
    end
end