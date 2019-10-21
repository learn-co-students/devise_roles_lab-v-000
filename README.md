# Devise with Roles

## Learning Objectives

1. Explain the use of role-based authorization with [Devise]
2. Design a set of roles to model a forum with different permission levels
3. Set up [Devise] roles to implement such a model

## Data Model

In this lab, we're going to make a simple discussion board.

We'll have a `Post` model, and three user roles: user, vip, and admin.

* `User`s can read anyone's `Po`sts, and create, read, update, and delete their own `Po`sts.
* VIPs can do everything a `User` can do, and update other users' `Post`s.
* Admins can do anything that `User`s and VIPs can do, and they can delete other users' `Post`s.

## Instructions

Provided is a Rails skeleton with the [Devise] gem installed.

1. Run the migrations. A basic `User` model and its migrations have been set up
   for you as part of the devise install
2. Add roles to the user model. The specs will tell you what roles are expected
   of the model
3. Create a `UsersController,` and add authentication and authorization filters
   to it. Ensure that only administrators can update or destroy users
4. Run `rails generate devise:views` to generate the views
5. Be sure to add the ERB code to display the [`flash`][flash] in
   `app/views/layouts/application.html.erb`

Once you've reached this point, all the `User` specs should be passing. For the
next part, we'll create a `Post` model, which has different permissions for
different `User` roles.

We've written one basic `Post` spec for you, but you will need to write
additional specs for the `Post` model and controller. You can reference the
feature and model specs for the `Users` controller to see how to write these.

1. Create a `Post` model and migration. `Post`s have an owner and content
2. Create a `Post`s controller. Ensure that it enforces the following requirements:
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
