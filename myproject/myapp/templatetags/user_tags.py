from django import template
from ..models import Buyerregister,Sellerregister

register = template.Library()

@register.filter
def is_buyer(user):
    return Buyerregister.objects.filter(user=user).exists()


@register.filter
def is_seller(user):
    return Sellerregister.objects.filter(user=user).exists()