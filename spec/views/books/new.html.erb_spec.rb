require 'spec_helper'

describe "books/new.html.erb" do
  before(:each) do
    assign(:book, stub_model(Book,
      :title => "MyString",
      :author => "MyString",
      :category => "MyString",
      :pages => 1,
      :owner => 1,
      :with => 1
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path, :method => "post" do
      assert_select "input#book_title", :name => "book[title]"
      assert_select "input#book_author", :name => "book[author]"
      assert_select "input#book_category", :name => "book[category]"
      assert_select "input#book_pages", :name => "book[pages]"
      assert_select "input#book_owner", :name => "book[owner]"
      assert_select "input#book_with", :name => "book[with]"
    end
  end
end
