import React from 'react'
import ReactDOM from 'react-dom'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <h1>It works!</h1>,
    document.body.appendChild(document.createElement('div')),
  )
})