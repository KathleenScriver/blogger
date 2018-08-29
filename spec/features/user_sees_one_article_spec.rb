require "rails_helper"

describe "user sees one article" do
  describe "they link from the articles index" do
    it 'displays information for one article' do
      article = Article.new(title: "New Title", body: "New Content")

      visit articles_path
      
      click_on(article.title)

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
  end
end
