# Devise with Roles

## Learning Objectives

1. Explain the use of role-based authorization with [Devise]
2. Design a set of roles to model a forum with different permission levels
3. Set up [Devise] roles to implement such a model

## Data Model

In this lab, we're going to make a simple discussion board.

First we'll have a `User` model, which pretty much always shows up when we talk
about [Devise]. There will be three possible roles: user, vip, and admin.

We'll also have a `Post` model.

* `User`s can read anyone's `Post`s, and create, read, update, and delete their own `Po`sts.
* VIPs can do everything a `User` can do, and update other users' `Post`s.
* Admins can do anything that `User`s and VIPs can do, and they can delete other users' `Post`s.

## Instructions

Provided is a Rails skeleton with the [Devise] gem installed.

1. Run the migrations. A basic `User` model and its migrations have been set up
   for you as part of the devise install. We'll want to get the roles working.
1. Take a look at the `User` model and the `User` spec
1. Run `rspec spec/models/user_spec.rb`
1. Add roles to the `User` model to get the `User` model specs working
1. **Note**: Running `rspec spec/models/post_spec.rb` will fail because we
   haven't created those model or tables yet.
1. Now that our `User` model is valid and has roles, let's get its controller
   working. Run its spec (and it will fail!) with `rspec ./spec/controllers/users_controller_spec.rb`
1. Use the failing specs to help you update the `UsersController.` You'll want
   to use authentication and authorization filters to help accomplish this
   goal. Ensure that only administrators can update or destroy users
1. Run `rails generate devise:views` to generate the views
1. Be sure to add the ERB code to display the [`flash`][flash] in
   `app/views/layouts/application.html.erb`

Once you've reached this point, all the `User` specs should be passing. For the
next part, we'll create a `Post` model, which has different permissions for
different `User` roles.

We've written one basic `Post` spec for you, but you will need to write
additional specs for the `Post` model and controller. You can reference the
feature and model specs for the `Users` controller to see how to write these.

1. Create a `Post` model and migration. `Post`s have an owner and content
2. Create the `Post`s controller. Ensure that it enforces the following requirements:
  - `Post`s can be created by any user
  - Anyone can read any `Post`
  - `User`s can edit or delete `Post`s they own
  - VIPs can edit anyone's `Post`s
  - Admins can do anything to any `Post`
3. Write views for your `Post`s
4. Try it out!

## Resources

* [Lab Review](https://www.youtube.com/watch?v=RTXyPhRBQ_4)


[Devise]: https://github.com/plataformatec/devise
[flash]: https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
