getBlock = (node) ->
	if node.type in ['BlockStatement', 'Program']
		node
	else if node.body
		getBlock node.body
	else
		null

module.exports =
	create: (context) ->
		AssignmentExpression: (node) ->
			isVariableAssignment = node.left.type is 'Identifier'
			declaredInThisScope = context.getScope().set.has node.left.name

			isFirstAssignment =
				node is
				getBlock(context.getScope().block)
					.body.map ({ expression }) -> expression
					.find (n) ->
						n.type is 'AssignmentExpression' and
						n.left.type is 'Identifier' and
						n.left.name is node.left.name

			if isVariableAssignment
				unless declaredInThisScope and isFirstAssignment
					context.report {
						node
						message: "Can't reassign variable '{{name}}'"
						data: node.left
					}
