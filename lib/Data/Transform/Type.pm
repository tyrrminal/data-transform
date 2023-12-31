use v5.38;
use experimental qw(class);

class Data::Transform::Type :isa(Data::Transform::Base) {
  use Data::Transform::Constants;

  use Scalar::Util qw(blessed);

  field $type :param //= undef;

  ADJUST {
    $self->_check_type();
  }

  method _set_type($t) { $type = $t; $self->_check_type() }

  method _check_type() {
    foreach my $t (grep {defined} $self->types()) {
      die("$t cannot be used with Data::Transform::Type - use Data::Transform::Nested") if($t eq 'ARRAY' || $t eq 'HASH');
    }
  }

  method types() {
    return ref($type) eq 'ARRAY' ? $type->@* : $type;
  }

  method applies_to($node, $position) {
    my $rv = $NO_MATCH;
    if(my $r = ref($node)) {
      if(blessed($node)) {
        foreach ($self->types()) {
          return $MATCH_EXACT_TYPE if($r eq $_);
          $rv = $MATCH_INHERITED_TYPE if($node->isa($_));
        }
      }
    }
    return $rv;
  }
}
