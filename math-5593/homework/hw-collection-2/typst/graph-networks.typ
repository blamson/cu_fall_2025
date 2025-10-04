#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set page(width: auto, height: auto, margin: 5mm, fill: white)

#let nodes = ("A1", "U1", "A2", "U2", "A3", "U4", "A5", "U5")
#let edges = (
	(3, 2),
	(4, 1),
	(1, 4),
	(0, 4),
	(3, 0),
	(5, 6),
	(6, 5),
)

#diagram({
	for (i, n) in nodes.enumerate() {
		let θ = 90deg - i*360deg/nodes.len()
		node((θ, 18mm), n, stroke: 0.5pt, name: str(i))
	}
	for (from, to) in edges {
		let bend = if (to, from) in edges { 10deg } else { 0deg }
		// refer to nodes by label, e.g., <1>
		edge(label(str(from)), label(str(to)), "-|>", bend: bend)
	}
})
