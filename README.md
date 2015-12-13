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


```
# reuqest
puts GFMarkdown.new().render("Hello world github/linguist#1 **cool**, and #1!")

# response
#=> <p>Hello world github/linguist#1 <strong>cool</strong>, and #1!</p>
```
```
# reuqest
puts GFMarkdown.new(
  context: "mruby/mruby"
).render("Hello world github/linguist#1 **cool**, and #1!")

# response
#=> <p>Hello world <a href="https://github.com/github/linguist/issues/1" class="issue-link" title="Binary detection issues on extensionless files">github/linguist#1</a> <strong>cool</strong>, and <a href="https://github.com/mruby/mruby/pull/1" class="issue-link" title="fix Makefile: quoted CC/LL are heap up to each Makefiles.">#1</a>!</p>
```
for GitHub Enterprise
```
# reuqest
puts GFMarkdown.new(
  url: "https://<GitHub Enterprise>/api/v3/",
  token: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
).render("Hello world github/linguist#1 **cool**, and #1!")

# response
#=> <p>Hello world github/linguist#1 <strong>cool</strong>, and #1!</p>
```
