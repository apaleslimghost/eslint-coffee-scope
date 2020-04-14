# eslint-plugin-coffee-scope

`const` for coffeescript. requires [`eslint-plugin-coffee`](https://github.com/helixbass/eslint-plugin-coffee)

```
npm i -D eslint-plugin-coffee eslint-plugin-coffee-scope
```

## usage

```js
module.exports = {
	plugins: ['coffee', 'coffee-scope'],
	parser: 'eslint-plugin-coffee',
	rules: {
		'coffee-scope/const': 'error'
	}
}
```

### code treated as an error with this rule

```coffee
variable = 10

variable = 20 # "Can't reassign variable 'variable'"

func = ->
	variable = 30 # "Can't reassign variable 'variable'"

```

