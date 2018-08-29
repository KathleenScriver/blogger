require "rails_helper"

describe "user creats a new article" do
  describe "they link from the articles index" do
    describe "they fill in a title and body" do
      it "creates a new article" do
        visit articles_path
        click_link("Create New Article")

        expect(current_path).to eq(new_article_path)

        fill_in :article_title, with: "New Title!"
        fill_in :article_body, with: "New Body!"
        click_on("Create Article")

        expect(page).to have_content(Article.last.title)
        expect(page).to have_content(Article.last.body)
      end
    end
  end
end
