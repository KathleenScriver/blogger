require "rails_helper"

describe "User edits an article" do
  describe "links from show page" do
    it 'should have form to edit article' do
      article = Article.create(title: "Article", body: "Body")

      visit article_path(article)
      click_link("Edit")

      new_title = "New Title"
      new_body = "New Body!"

      expect(current_path).to eq(edit_article_path(article))
      fill_in :article_title, with: new_title
      fill_in :article_body, with: new_body
      click_on("Update Article")

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content(new_title)
      expect(page).to have_content(new_body)
    end
  end
end
