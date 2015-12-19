class GFMarkdown

  def initialize(opt = {})
    @url = opt[:url] ? opt[:url] : "https://api.github.com/markdown"
    @token = opt[:token]
    @context = opt[:context]
    @mode = @context ? "gfm" : "markdown"
  end

  def render data

    headers = {
      'User-Agent' => "mruby-gfmarkdown",
    }
    headers["Authorization"] = ( "token " << @token ) if @token

    postdata = {
      :text => data,
      :mode => @mode,
    }
    postdata[:context] = @context if @context

    HttpRequest.new().post(@url,JSON.generate(postdata),headers).body
  end

end
