<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/custom/masked-ape-club-for-ruby.svg" height="55px" name="# Masked Ape Club for Ruby" alt="Masked Ape Club for Ruby">
</a>

Let the apes out and free them from backgrounds. With the goal to bring them to context.
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/examples.svg" height="55px" name="examples" alt="Examples">
</a>

### Create transparent background

```ruby
require 'masked_ape_club'

a = MaskedApeClub::Load.new()
a.load( id: 1711 )
a.mask()
a.write( path: 'test.png' )
```

### Censored your ape

```ruby
require 'masked_ape_club'

a = MaskedApeClub::Load.new()
a.load( id: 1711 )
a.censored()
a.write( path: 'test.png' )
```

### Go on holiday with your ape!
```ruby
require 'masked_ape_club'

a = MaskedApeClub::Load.new()
a.load( id: 1711 )
a.mask()

background = 'background.png'
blob = open( background ).read()
a.background( blob: blob )
a.write( path: 'test.png' )
```


<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com//a6b8/a6b8/main/assets/headlines/default/table-of-contents.svg" height="55px" name="table-of-contents" alt="Table of Contents">
</a>
<br>

1. [Quickstart](#quickstart)<br>
2. [Setup](#setup)<br>
3. [Methods](#methods)<br>
4. [Contributing](#contributing)<br>
5. [Limitations](#limitations)<br>
6. [Credits](#credits)<br>
7. [License](#license)<br>
8. [Code of Conduct](#code-of-conduct)<br>
9.  [Support my Work](#support-my-work)<br>

<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/quickstart.svg" height="55px" name="quickstart" alt="Quickstart">
</a>

```bash
gem install masked_ape_club
```

``` ruby
require 'masked_ape_club'

id = 1711
a = MaskedApeClub::Load.new()
a.load( id: id )
a.mask_ape( id: id)
a.write( path: 'your_ape.png' )
```
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/setup.svg" height="55px" name="setup" alt="Setup">
</a>

Add this line to your application's Gemfile:

```ruby
gem 'masked_ape_club'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install masked_ape_club


On Rubygems: 
- Gem: https://rubygems.org/gems/masked_ape_club
- Profile: https://rubygems.org/profiles/a6b8

<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/methods.svg" height="55px" name="methods" alt="Methods">
</a>

### .load( id: )
```ruby
require 'masked_ape_club'

a = MaskedApeClub::Load.new()
a.load( id: 1711 )
a.write( path: 'test.png' )
```


**Input**
| **Key** | **Type** | **Required** | **Example** | **Description** |
|------:|:------|:------|:------|:------|
| **:id** | ```String``` | Yes | 1711 | Choose your ape. |

**Return**<br>
True    
<br>

### .mask( fuzz: '1%', position: 1500, radius: 25 )
```ruby
require 'masked_ape_club'

a = MaskedApeClub::Load.new()
a.load( id: 1711 )
a.mask()
a.write( path: 'test.png' )
```


**Input**
| **Key** | **Type** | **Required** | **Example** | **Description** |
|------:|:------|:------|:------|:------|
| **:fuzz** | ```String``` | No | "1%" | Choose threshold for erasing background, dont forget "%" |
| **:position** | ```Integer``` | No | 1500 | Set pixel index which represent the background color. Every Image has 631x631 Pixels, 1500 should be near on the left right in row 3. |
| **:size** | ```Integer``` | No | 2 | Draws a small frame arround the image, for better result on keying the background. |

**Return**<br>
True    
<br>

### .censored( upper_left_x: 240, upper_left_y: 210, lower_right_x: 460, lower_right_y: 270, color: 'black' )
```ruby
require 'masked_ape_club'

a = MaskedApeClub::Load.new()
a.load( id: 1711 )
a.censored()
a.write( path: 'test.png' )
```


**Input**
| **Key** | **Type** | **Required** | **Example** | **Description** |
|------:|:------|:------|:------|:------|
| **:upper_left_x** | ```Integer``` | No | 240 | Set rectangle coordinate. |
| **:upper_left_y** | ```Integer``` | No | 210 |  Set rectangle coordinate. |
| **:lower_right_x** | ```Integer``` | No | 460 |  Set rectangle coordinate. |
| **:lower_right_y** | ```Integer``` | No | 270 |  Set rectangle coordinate. |
| **:color** | ```Integer``` | No | 'black' | Set background color of rectangle |

**Return**<br>
True    
<br>

### .background( blob:, gravity: Magick::CenterGravity, offset_x: 0, offset_y: 0, width: 631, height: 631)

```ruby
require 'masked_ape_club'

a = MaskedApeClub::Load.new()
a.load( id: 1711 )
a.mask()

background = 'background.png'
blob = open( background ).read()
a.background( blob: blob )
a.write( path: 'test.png' )
```


**Input**
| **Key** | **Type** | **Required** | **Example** | **Description** |
|------:|:------|:------|:------|:------|
| **:blob** | ```String``` | Yes |  | Set rectangle coordinate. |
| **:gravity** | ```RMagick Constant``` | No | 210 | See RMagick documentation for details: [RMagick Gravity](https://rmagick.github.io/constants.html)|
| **:offset_x** | ```Integer``` | No | 0 |  Offset ape on the x axes. |
| **:offset_y** | ```Integer``` | No | 0 |  Offset ape on the y axes. |
| **:width** | ```Integer``` | No | 631 | Set default canvas width |
| **:height** | ```Integer``` | No | 631 | Set default canvas height |
 
**Return**<br>
True    
<br>
<br>
<br>

<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/contributing.svg" height="55px" name="contributing" alt="Contributing">
</a>

Bug reports and pull requests are welcome on GitHub at https://github.com/a6b8/masked-ape-club-for-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/a6b8/masked-ape-club-for-ruby/blob/master/CODE_OF_CONDUCT.md).
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/limitations.svg" height="55px" name="limitations" alt="Limitations">
</a>
- Only tested with some ape
<br>
<br>
<br>

<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/credits.svg" height="55px" name="credits" alt="Credits">
</a>

- [RMagick](https://github.com/rmagick/rmagick)
<br>
<br>
<br>

<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/license.svg" height="55px" name="license" alt="License">
</a>

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
<br>
<br>
<br>
<a href="#table-of-contents">
<img src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/code-of-conduct.svg" height="55px" name="code-of-conduct" alt="Code of Conduct">
</a>
    
Everyone interacting in the masked-ape-club-for-ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/a6b8/masked-ape-club-for-ruby/blob/master/CODE_OF_CONDUCT.md).
<br>
<br>
<br>
<a href="#table-of-contents">
<img href="#table-of-contents" src="https://raw.githubusercontent.com/a6b8/a6b8/main/assets/headlines/default/support-my-work.svg" height="55px" name="support-my-work" alt="Support my Work">
</a>
    
Donate by [https://www.paypal.com](https://www.paypal.com/donate?hosted_button_id=XKYLQ9FBGC4RG)