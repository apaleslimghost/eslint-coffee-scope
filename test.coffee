plugin = require './'

{ RuleTester } = require 'eslint'

tester = new RuleTester parser: require.resolve 'eslint-plugin-coffee'

tester.run 'coffee-scope', plugin.rules.const,
	valid: [code: 'foo = 5']
	invalid: [
		code: 'foo = 5 ; foo = 10'
		errors: [message: "Can't reassign variable 'foo'"]
	,
		code: 'foo = 5 ; bar = -> foo = 10'
		errors: [message: "Can't reassign variable 'foo'"]
	]
