from starkware.cairo.common.serialize import serialize_word

func main{output_ptr: felt*}() {
    alloc_locals;
    local x;
    %{ ids.x = 8 %}

    serialize_word(x * x);
    return ();
}
