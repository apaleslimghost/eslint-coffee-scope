module.exports = create: (context) ->
	AssignmentExpression: (node) ->
		unless context.getScope().set.has node.left.name
			context.report { node, message: "Variable '{{name}}' was declared in upper scope", data: node.left }
				

