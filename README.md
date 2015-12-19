# mruby-gfmarkdown
Client library for GitHub Flavored Markdown (GFM) API

refs: https://developer.github.com/v3/markdown/

## install

add conf.gem line to build_config.rb

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :gitub => 'harasou/mruby-gfmarkdown'
end
```

## example

sample markdown.
```
$ build/host/bin/mirb
mirb - Embeddable Interactive Ruby Shell

> text = "rendering\n- harasou/mruby-gfmarkdown#1\n- #1!"
```

`mode:` markdown
```ruby
> puts GFMarkdown.new.render(text)
<p>rendering</p>

<ul>
<li>harasou/mruby-gfmarkdown#1</li>
<li>#1!</li>
</ul>
 => nil
```

`mode:` gfm
```ruby
> puts GFMarkdown.new(mode: "gfm").render(text)
<p>rendering</p>

<ul>
<li><a href="https://github.com/harasou/mruby-gfmarkdown/issues/1" class="issue-link js-issue-link" data-url="https://github.com/harasou/mruby-gfmarkdown/issues/1" data-id="123095833" data-error-text="Failed to load issue title" data-permission-text="Issue title is private">harasou/mruby-gfmarkdown#1</a></li>
<li>#1!</li>
</ul>
 => nil
```

`mode:` gfm, `context:` harasou/mruby-gfmarkdown
```ruby
> puts GFMarkdown.new(mode: "gfm", context: "harasou/mruby-gfmarkdown").render(text)
<p>rendering</p>

<ul>
<li><a href="https://github.com/harasou/mruby-gfmarkdown/issues/1" class="issue-link js-issue-link" data-url="https://github.com/harasou/mruby-gfmarkdown/issues/1" data-id="123095833" data-error-text="Failed to load issue title" data-permission-text="Issue title is private">harasou/mruby-gfmarkdown#1</a></li>
<li>
<a href="https://github.com/harasou/mruby-gfmarkdown/issues/1" class="issue-link js-issue-link" data-url="https://github.com/harasou/mruby-gfmarkdown/issues/1" data-id="123095833" data-error-text="Failed to load issue title" data-permission-text="Issue title is private">#1</a>!</li>
</ul>
 => nil
```

`url:` yourdomain.com, `token:` xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```ruby
> puts GFMarkdown.new(url: "https://yourdomain.com/api/v3/markdown", token: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx").render(text)
<p>rendering</p>

<ul>
<li>harasou/mruby-gfmarkdown#1</li>
<li>#1!</li>
</ul>
 => nil
```
