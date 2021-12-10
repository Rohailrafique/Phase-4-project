class PostDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :condensed_content
  has_one :user

  def condensed_content
    renderer = Redcarpet::Render::StripDown.new
    markdown = Redcarpet::Markdown::new(renderer)
    "#{markdown.render(self.object.content[0..400])}..."
  end
end
