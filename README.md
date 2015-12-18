# Presentdown
A markdown presentation tool written in ReactJS.

### How to:

#### Complete

1. Fork and clone this repository.
2. Change directories to `Presentdown`
3. Install NPM and node

#### Get going after forking and installing

1. `npm install`
2. Write your slides:
  - All slides should follow `[slide_number].[slide_name].md` naming
  - Slides can be in markdown or HTML inside markdown
3. `gulp clean`
4. `gulp prepare`
5. `gulp build`
6. Run or compile for stand-alone package

**Running**
- `gulp run`
- See results
  [localhost:8080](http://localhost:8080)

**Compile for external use**

1. `gulp compile`
2. Copy contents of dist to server/usb/folder
3. Open index.html that was copied from from dist

### Slide DSL:

#### Headings

Only one Heading is permitted per slide. The first H1 is converted into a
heading automatically.

```markdown
  # Heading
```

#### Content and the hr tag

Hr tags get replaced and converted into div wrappers for the
main content. If possible only use 1 hr per slide

### Content

Content can be of any valid github flavoured markdown or internal HTML.

### Filenames:

The title slide must be named 0.[slide_name].md
All slides must be named 1-n in order.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/whatisinternet/Presentdown. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).



