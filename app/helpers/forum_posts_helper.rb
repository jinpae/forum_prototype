module ForumPostsHelper
	def markdownify(content)
		pipeline_context = { gfm: true }
		pipeline = HTML::Pipeline.new [
			HTML::Pipeline::MarkdownFilter
		], pipeline_context
		pipeline.call(content)[:output].to_s
	end
end
