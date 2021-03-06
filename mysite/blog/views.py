from django.views import generic
from .models import Post
from django.http import HttpResponse
from django.shortcuts import render

# class PostList(generic.ListView):
#     """
#     Return all posts that are with status 1 (published) and order from the latest one.
#     """
#     queryset = Post.objects.filter(status=1).order_by('-created_at')
#     template_name = 'index.html'


# class PostDetail(generic.DetailView):
#     model = Post
#     template_name = 'post_detail.html'

def home(response):
    return render(response, "blog/home.html", {})

def experience(response):
    return render(response, "blog/experience.html", {})

def certifications(response):
    return render(response, "blog/certifications.html", {})