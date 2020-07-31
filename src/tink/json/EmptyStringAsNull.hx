package tink.json;

#if !macro

@:genericBuild(tink.json.EmptyStringAsNull.build())
class EmptyStringAsNull<T> {}

#else

import haxe.macro.Expr;
import tink.macro.BuildCache;
using tink.MacroApi;

class EmptyStringAsNull {
	public static function build() {
		return BuildCache.getType('tink.json.EmptyStringAsNull', (ctx:BuildContext) -> {
			final ct = ctx.type.toComplex();
			({
				name: ctx.name,
				pack: ['tink', 'json'],
				kind: TDAlias(ct),
				fields: [],
				pos: ctx.pos,
				meta: [{
					name: ':jsonParse',
					params: [macro (s:tink.json.Serialized<$ct>) -> s == '""' ? null : s.parse()],
					pos: ctx.pos,
				}]
			}:TypeDefinition);
		});
	}
}

#end