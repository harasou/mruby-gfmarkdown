class GFMarkdown

  def initialize(opt = {})
    @url = opt[:url] ? opt[:url] : "https://api.github.com/markdown"
    @token = opt[:token]
    @mode = opt[:mode]
    @context = opt[:context]
  end

  def render text
    headers = {
      'User-Agent' => "mruby-gfmarkdown",
    }
    headers['Authorization'] = "token #{@token}" if @token

    postdata = {
      :text => text,
    }
    postdata[:mode] = @mode if @mode
    postdata[:context] = @context if @context

    HttpRequest.new().post(@url,JSON.generate(postdata),headers).body
  end

end
