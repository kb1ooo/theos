package Logos::Subclass;
use Logos::Class;
our @ISA = ('Logos::Class');

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my $self = $class->SUPER::new();
	$self->{SUPERCLASS} = undef;
	$self->{PROTOCOLS} = {};
	$self->{IVARS} = [];
	$self->{OVERRIDDEN} = 1;
	bless($self, $class);
	return $self;
}

##################### #
# Setters and Getters #
# #####################
sub superclass {
	my $self = shift;
	if(@_) { $self->{SUPERCLASS} = shift; }
	return $self->{SUPERCLASS};
}
##### #
# END #
# #####

sub initExpr {
	::fileError(-1, "Generator hasn't implemented Subclass::initExpr :(");
	return "";
}

sub _initExpr {
	my $self = shift;
	return $self->initExpr;
}

sub _metaInitExpr {
	my $self = shift;
	return "object_getClass(".$self->variable.")";
}

sub addProtocol {
	my $self = shift;
	my $protocol = shift;
	$self->{PROTOCOLS}{$protocol}++;
}

sub addIvar {
	my $self = shift;
	my $ivar = shift;
	$ivar->class($self);
	push(@{$self->{IVARS}}, $ivar);
}

sub getIvarNamed {
	my $self = shift;
	my $name = shift;
	foreach(@{$self->{IVARS}}) {
		return $_ if $_->name eq $name;
	}
	return undef;
}

sub declarations {
	::fileError(-1, "Generator hasn't implemented Subclass::declarations :(");
	return "";
}

sub initializers {
	::fileError(-1, "Generator hasn't implemented Subclass::initializers :(");
	return "";
}

1;
