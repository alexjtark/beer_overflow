# Review

## Startup

Clean. Yay!

## Functionality

I was unable to login.  I created a user and then I tried to sign in.

    Missing template sessions/create, application/create with {:locale=>[:en],
    :formats=>[:html], :variants=>[], :handlers=>[:erb, :builder, :raw, :ruby,
    :coffee, :jbuilder]}. Searched in: *
    "/Users/sgharms/.gem/ruby/2.1.2/gems/web-console-2.0.0/lib/action_dispatch/templates"
    * "/Users/sgharms/moose/overflows/beer_overflow/beer_overflow/app/views"

If I sign in i go to this code:


    def create
      @user = User.find_by(email: session_params[:email])
      if @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
      else
        @errors = @user.errors.messages
        redirect_to :back
      end
    end


in SessionsController.  Which means that if i authenticate we will render the
create template which.....**you don't have**


    ➜  beer_overflow git:(master) ✗ ls app/views/sessions
    new.html.erb
    ➜  beer_overflow git:(master) ✗

What's going on here?  I didn't catch this one on the video...it's not putting
the best foot forward here if I can't get your app to run.

## Tests

17 examples seems a little bit light.  I think there could have been more.
Also the tests on master are failing.  I would have expected that to not be the
case.

## Controllers / Routes

As I say in the video, I think that the design is a bit off.  It seems like
there shouldn't have to be separate controllers for handling comment creation
per a given type of parent (e.g. `answers_comments`, `questions_comments`, etc).
It seems like this should be handled in a singular CommentsController which has
the ability to resolve (based on data from the form) what its parent is.




