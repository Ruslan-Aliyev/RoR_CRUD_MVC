# Ruby on Rails MVC

## Setup

- Run RailsInstaller
- Update gems
- Install node
- In Command Line: `gem install rails --no-ri --no-rdoc`

## New Project

- In Command Line: `rails new tripadvisor`

## Database

### Gemfile
```
source 'http://rubygems.org'
...
gem 'mysql2', '~> 0.3.18'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'

```

### config\database.yml
```
default: &default
   adapter: mysql2
   database: tripadvisor
   username: root
   password: 
   host: localhost
   
development:
   adapter: mysql2
   database: tripadvisor
   username: root
   password: 
   host: localhost
   
test:
   adapter: mysql2
   database: tripadvisor
   username: root
   password: 
   host: localhost
   
production:
   adapter: mysql2
   database: tripadvisor
   username: root
   password: 
   host: localhost
```

### Set up database

![]()

### Command Line

```
bundle install
rails generate scaffold rating destination:string country:string rating:string
rake db:migrate
```

## Code

### config\routes.rb

```
Rails.application.routes.draw do
  resources :ratings
end
```

### app\controllers\ratings_controller.rb

```
class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:destination, :country, :rating)
    end
end
```

### app\models\rating.rb

```
class Rating < ActiveRecord::Base
    self.table_name = "all"
end
```

### app\assets\stylesheets\application.css.sass

```html
@import "bootstrap"
```

### app\views\layouts\application.html.erb

```html
<!DOCTYPE html>
<html>
<head>
  <title>Tripadvisor</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
  <style>
    h1{
      text-align: center;
      padding:20px;
    }
    a{
        margin:15px;
        background-color:white;
    }

    /* unvisited link */
    a:link {
        color: green;
        background-color:white;
    }
    /* visited link */
    a:visited {
        color: blue;
        background-color:white;
    }
    /* mouse over link */
    a:hover {
        color: black;
        background-color:gray;
    }
    /* selected link */
    a:active {
        color: gray;
        background-color:gray;
    }
  </style>
</head>
<body>

<%= yield %>
</body>
</html>
```

### app\views\ratings\index.html.erb

```
<h1>Trip Advisor</h1>

<table class="table">
  <thead>
    <tr>
      <th>Destination</th>
      <th>Country</th>
      <th>Rating</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @ratings.each do |rating| %>
      <tr>
        <td><%= link_to rating.destination, rating %></td>
        <td><%= rating.country %></td>
        <td><%= rating.rating %></td>
        <td><%= link_to 'Edit', edit_rating_path(rating) %></td>
        <td><%= link_to 'Delete', rating, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Rating', new_rating_path %>
```

### app\views\ratings\show.html.erb

```
<p id="notice"><%= notice %></p>

<p>
  <strong>Destination:</strong>
  <%= @rating.destination %>
</p>

<p>
  <strong>Country:</strong>
  <%= @rating.country %>
</p>

<p>
  <strong>Rating:</strong>
  <%= @rating.rating %>
</p>

<%= link_to 'Edit', edit_rating_path(@rating) %> |
<%= link_to 'Back', ratings_path %>
```

### app\views\ratings\new.html.erb

```
<h1>New rating</h1>

<%= render 'form' %>

<%= link_to 'Back', ratings_path %>
```

### app\views\ratings\edit.html.erb

```
<h1>Editing rating</h1>

<%= render 'form' %>

<%= link_to 'Show', @rating %> |
<%= link_to 'Back', ratings_path %>
```

## Results

### Command Line

```
rails server
```

![]()
