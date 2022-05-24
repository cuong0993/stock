from util import grep

used_strings = list(
    map(lambda x: x.split('.')[-1],
        sorted(set(grep('L10n.of\(context\)\!\.\w+', "../lib", '.dart')))))
strings = list(
    map(lambda x: x.replace('"', ''),
        sorted(set(grep('"[^ @]*?(?=":)', "../assets/l10n", '.arb')))))
diff = [item for item in used_strings if item not in strings
        ] + [item for item in strings if item not in used_strings]
if len(diff) != 0:
    raise Exception(diff)
