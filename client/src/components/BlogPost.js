import React, { useContext, useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import ReactMarkdown from "react-markdown";
import { UserContext } from "../context/user";
import remarkGfm from 'remark-gfm';

export default function BlogPost({ handleFun }) {
  const { user, setUser } = useContext(UserContext);
  const navigate = useNavigate();
  const [blogPost, setBlogPost] = useState();
  const params = useParams();



  useEffect(() => {
    fetch(`/posts/${params.id}`)
      .then((resp) => {
        if (resp.ok) {
          resp.json().then((data) => setBlogPost(data));
        } else {
          resp.json().then(data => handleFun(data.errors[0]))
          navigate('/')
        }
      })
      
  }, []);

  async function handleDeleteClick() {
    const response = await fetch(`/posts/${params.id}`, {
      method: "DELETE",
    });

    const data = await response.json();
    if (response.ok) {
      navigate("/");
    } else {
      alert(data.errors.join("\n \n"));
    }
  }

  function handleEditClick(blogPost) {
    navigate(`/blogs/${blogPost.id}/edit`)
  }

  if (!blogPost) return null;

  return (
    <div className="BlogPost px-5 pt-2">
      <h3>{blogPost.title}</h3>
      <span>
        <ReactMarkdown children={blogPost.content} remarkPlugins={[remarkGfm]} />
      </span>
      {user.id === blogPost.user.id ? (
        <>
          <button id="form-submit-button" className='btn btn-dark' onClick={(e)=>handleEditClick(blogPost)}>Edit post</button>
          <button className='btn btn-danger ms-3' onClick={handleDeleteClick}>Delete post</button>
        </>
      ) : null}
      {/* <p>Reaction</p>
      <p>Reaction</p>
      <p>Reaction</p> */}
    </div>
  );
}
