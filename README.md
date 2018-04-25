# automatic_page_titles gem

Allows you to easily set page titles per view in your Rails app, but also follows Ruby on Rails naming conventions to set sensible default title if none is specified.

## Example

| Route            | Page title                  |
|------------------|-----------------------------|
| /posts           | "Posts"                     |
| /posts/:id       | "Post: #{post.title}        |
| /author/:id      | "Author: #{author.name}     |
| /posts/:id/new   | "New Post"                  |
| /posts/:id/edit  | "Edit Post: #{post.title}"  |
| /posts/:id/print | "Print Post: #{post.title}" |
| /posts/sort      | "Sort Posts"                |
| /admin/users     | "Administrator - Users"     |    


## Usage

In your layout add the `page_title` helper method.

e.g. within app/views/layouts/application.html.erb

```erb
  <title><%= page_title %></title>
```

### Explicitly setting a page title

To set a specific title for a view, call the `page_title` method within the view with desired title.

e.g. within app/views/welcome/index.html.erb

```erb
  <%- page_title("My page title") %>
```

This method will also return the set title, enabling syntax like this:

```erb
  <h1><%= page_title("My page title") %></h1>
```

The title can also be set by setting the @page_title variable
```
  @page_title = "My page title"
```

### Adding extra information to the page title

It is best to do this within the title tag:

```erb
  <title>
    <% unless current_page?(root_url) %>
      My app:
    <% end %>
    <%= page_title %>
  </title>
```
## History

This gem was built ontop of the implicit_titles gem https://github.com/neilang/implicit_page_titles


## Compatibility

Tested with Rails 5, and Ruby 2+. Although untested, it would likely work with Rails 4 & 3 and Ruby 1.9.x.

## License

This project uses MIT-LICENSE.
