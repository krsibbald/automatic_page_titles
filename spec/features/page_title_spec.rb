describe "page title", type: :feature do
  it "returns the app name for the root" do
    visit root_path
    expect(page).to have_title "Welcome"
  end

  it "will use the page title set in the view" do
    visit view_set_page_title_path
    expect(page).to have_title "Hello World!"
  end

  it "converts the custom action and controller to a page title" do
    visit another_route_path
    expect(page).to have_title "Another Route Welcome"
  end

  it "returns the route path name for index pages" do
    visit posts_path
    expect(page).to have_title "Posts"
  end

  it "uses the main record `title` for show pages" do
    post = Post.create(title: "My post")
    visit post_path(post)
    expect(page).to have_title "Post: My post"
  end

  it "prepends new for a new record" do
    visit new_post_path
    expect(page).to have_title "New Post"
  end

  it "prepends edit when editing a record" do
    post = Post.create(title: "A post")
    visit edit_post_path(post)
    expect(page).to have_title "Edit Post: A post"
  end

  it "uses the main record `name` for show pages if there is no title attribute" do
    author = Author.create(name: "John Smith")
    visit author_path(author)
    expect(page).to have_title "John Smith"
  end

  it "prepends 'Administrator -' in pathes that contain '/admin/'" do
    visit admin_users_path
    expect(page).to have_title "Administrator - Users"
  end

  it "creates title from custom action on colleciton" do
    visit sort_posts_path
    expect(page).to have_title "Sort Posts"
  end

  it "creates title from custom action - on item" do
    post = Post.create(title: "The Best")
    visit print_post_path(post)
    expect(page).to have_title "Print Post: The Best"
  end
end
