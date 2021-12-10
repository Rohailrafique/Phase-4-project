# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.reset_pk_sequence


kenny = User.create(email: "fitzgeraldkd@gmail.com", display_name: "kenny", username: "fitzgeraldkd", password_digest: BCrypt::Password.create('password123') , twitter_url: "https://twitter.com/FlatironSchool", facebook_url: "https://www.facebook.com/kenofpianos", linkedin_url: "https://www.linkedin.com/in/kenneth-fitzgerald/", image_url: "https://i.imgur.com/5RA8IBG.jpg")
rohail = User.create(email: "rohail_shahid@hotmail.com", display_name: "rohail", username: "rohail", password_digest: BCrypt::Password.create('password123') , twitter_url: "https://twitter.com/FlatironSchool", facebook_url: "https://www.facebook.com/rohail.rafique", linkedin_url: "https://www.linkedin.com/in/rohail-rafique-1110882a/", image_url: "https://media-exp1.licdn.com/dms/image/C4D03AQEF_UGrG6jGVQ/profile-displayphoto-shrink_800_800/0/1636816685334?e=1644451200&v=beta&t=m2xhdsv5h9CdAHg2Krul8x2NKb_PPKF3dbrVgLWYQ2E")
adam = User.create(email: "adammooredev1@gmail.com", display_name: "adam", username: "amoore", password_digest: BCrypt::Password.create('password321') , twitter_url: "https://twitter.com/FlatironSchool", facebook_url: "https://www.facebook.com/AdamYoloMoore", linkedin_url: "https://www.linkedin.com/in/adam-moore-926b84227/", image_url: "https://ca.slack-edge.com/T02MD9XTF-U02B21KUT52-10a2be666396-512")

20.times do
  this_user = User.create(
    email: Faker::Internet.email,
    display_name: Faker::Name.name,
    username: Faker::Internet.username(separators: %w(_)),
    password: 'password',
    image_url: Faker::Avatar.image(slug: Faker::Lorem.word)
    # image_url: Faker::LoremFlickr.image(search_terms: ['cats', 'dogs'])
  )

  5.times do
    this_user.posts.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraphs(number: 12).join("\n\n")
    )
  end
end

Follower.create(follower: kenny, followed: rohail)

Post.create(user_id: 1, title: "test-blog", content: "blablabalblabl")
Post.create(user_id: 2, title: "test-blog", content: "asdad")
Post.create(user_id: 3, title: "test-blog", content: "blablabvvvvvvvalblabl")

Post.create(user: kenny, title: 'React-Calendar With Custom Styles', content: "I was looking for a calendar to use in a React project and found the [React-Calendar](https://www.npmjs.com/package/react-calendar) component. It has all the functionality that I was looking for and saves me a lot of time from building it out on my own. It can be controlled with state so that the selected date(s) can affect what displays in the app. I wanted to customize its styling to fit my project, so here's what I came up with!
  
  The examples here are based on the following components:
  - react (v17.0.2)
  - react-calendar (v3.5.0)
  - styled-components (v5.3.3)
  
  ## Initial Styles
  
  I will be using the [styled-components](https://styled-components.com/) package to add styles to my project, but this could all be done in a CSS file if that's your preferred method. Here's my starter code:
  
  ```jsx
  import Calendar from 'react-calendar';
  import styled from 'styled-components';
  
  function App() {
    return (
      <CalendarContainer>
        <Calendar calendarType='US' />
      </CalendarContainer>
    );
  }
  
  export default App;
  
  const CalendarContainer = styled.div`
    /* ~~~ container styles ~~~ */
    max-width: 600px;
    margin: auto;
    margin-top: 20px;
    background-color: #d4f7d4;
    padding: 10px;
    border-radius: 3px;
  `;
  ```
  
  I have some styles started for the `<div>` that holds the calendar just so the calendar is not floating in the void.
  
  > Note: I also applied the `calendarType` property to the calendar that sets the first day of the week to Sunday. This is how I'm used to seeing calendars, but by leaving this property off the week should start with Monday.
  
  Here's what it looks like before any styling has been applied to the `<Calendar />` component:
  
  ![React-Calendar with no styling](https://i.imgur.com/2R7f05L.png)
  
  You can see that this component is built with a lot of button components. Before we go through applying our own styles, let's look at a stylesheet the component is packaged with.
  
  ## Default Stylesheet
  
  The react-calendar component has the option to import a default stylesheet. It can be imported by adding this line to the top of your file:
  
  ```jsx
  import 'react-calendar/dist/Calendar.css';
  ```
  
  Here's what the calendar looks like with these styles:
  
  ![React-Calendar with default styling](https://i.imgur.com/1phKNfG.png)
  
  Looks much better! However I want to really make it my own for and have control over how it looks. This way I can make sure its appearance is consistent with the rest of my app. Luckily we can add our own styles!
  
  ## Custom Styling
  
  Since we can nest selectors with styled-components (similar to SCSS), we can add all of our custom styles into the `CalendarContainer` styled component. React-Calendar creates elements with certain classes already applied, so we can use those as our selectors. 
  
  ### Navigation
  
  Let's start by updating the navigation. Here's what I want to do:
  
  - Have the navigation take the full width of the calendar
  - Make the text in the center button bold
  - Make the arrow buttons larger
  
  Here's how we can do that:
  
  ```jsx
  const CalendarContainer = styled.div`
    /* ~~~ container styles ~~~ */
    /* ... */
  
    /* ~~~ navigation styles ~~~ */
    .react-calendar__navigation {
      display: flex;
  
      .react-calendar__navigation__label {
        font-weight: bold;
      }
  
      .react-calendar__navigation__arrow {
        flex-grow: 0.333;
      }
    }
  `;
  ```
  
  ![React-Calendar with navigation styled](https://i.imgur.com/nUPumMu.png)
  
  ### Labels
  
  Next I want to center the labels for the days of the week:
  
  ```jsx
  const CalendarContainer = styled.div`
    /* ~~~ container styles ~~~ */
    /* ~~~ navigation styles ~~~ */
    /* ... */
  
    /* ~~~ label styles ~~~ */
    .react-calendar__month-view__weekdays {
      text-align: center;
    }
  `;
  ```
  
  ![React-Calendar with labels styled](https://i.imgur.com/nzNYIXF.png)
  
  ### Buttons
  
  The layout is looking good, but we still need to apply some styles to the buttons:
  
  ```jsx
  const CalendarContainer = styled.div`
    /* ~~~ container styles ~~~ */
    /* ~~~ navigation styles ~~~ */
    /* ~~~ label styles ~~~ */
    /* ... */
  
    /* ~~~ button styles ~~~ */
    button {
      margin: 3px;
      background-color: #6f876f;
      border: 0;
      border-radius: 3px;
      color: white;
      padding: 5px 0;
  
      &:hover {
        background-color: #556b55;
      }
  
      &:active {
        background-color: #a5c1a5;
      }
    }
  `;
  ```
  
  ![React-Calendar with buttons styled](https://i.imgur.com/f2VHrxP.png)
  
  The buttons look a little better, but now the layout is all messed up! There are only six days in a row now. Let's fix that!
  
  ### Grid
  
  So by default the views have the style `display: flex;` applied, which unfortunately leads to items spilling over to other rows instead of ensuring that there are always 7 days in a week. Luckily we can overwrite this behavior by using `grid`:
  
  ```jsx
  const CalendarContainer = styled.div`
    /* ~~~ container styles ~~~ */
    /* ~~~ navigation styles ~~~ */
    /* ~~~ label styles ~~~ */
    /* ~~~ button styles ~~~ */
    /* ... */
  
    /* ~~~ day grid styles ~~~ */
    .react-calendar__month-view__days {
      display: grid !important;
      grid-template-columns: 14.2% 14.2% 14.2% 14.2% 14.2% 14.2% 14.2%; 
      
      .react-calendar__tile {
        max-width: initial !important;
      }
    }
  `;
  ```
  
  ![React-Calendar with grid display](https://i.imgur.com/K8t6mFU.png)
  
  Awesome, by creating a grid with seven columns (each at 14.2%), we're back to seven days a week!
  
  > Note that some elements that react-calendar creates have styles applied directly to the element. To overwrite these, we need the `!important` rule so our class selectors can take precedence.
  
  ### Neighboring Months and Weekends
  
  The days of neighboring months look identical to the days of the active month right now, but we can change that as well. We can also change styles of days on the weekend.
  
  ```jsx
  const CalendarContainer = styled.div`
    /* ~~~ container styles ~~~ */
    /* ~~~ navigation styles ~~~ */
    /* ~~~ label styles ~~~ */
    /* ~~~ button styles ~~~ */
    /* ~~~ day grid styles ~~~ */
    /* ... */
  
    /* ~~~ neighboring month & weekend styles ~~~ */
    .react-calendar__month-view__days__day--neighboringMonth {
      opacity: 0.7;
    }
    .react-calendar__month-view__days__day--weekend {
      color: #dfdfdf;
    }
  `;
  ```
  
  ![React-Calendar with neighboring month and weekend days styled](https://i.imgur.com/jM2jT7v.png)
  
  ### Active Day
  
  With React-Calendar, when the user clicks on a day it is set as the active day. However there's no way for the user to tell which day is currently selected yet, so let's address that now:
  
  ```jsx
  const CalendarContainer = styled.div`
    /* ~~~ container styles ~~~ */
    /* ~~~ navigation styles ~~~ */
    /* ~~~ label styles ~~~ */
    /* ~~~ button styles ~~~ */
    /* ~~~ day grid styles ~~~ */
    /* ~~~ neighboring month & weekend styles ~~~ */
    /* ... */
  
    /* ~~~ active day styles ~~~ */
    .react-calendar__tile--range {
        box-shadow: 0 0 6px 2px black;
    }
  `;
  ```
  
  ![React-Calendar with active day styled](https://i.imgur.com/hdjA962.png)
  
  ### Other Views
  
  Our month view is looking good, but what about the other views? Let's take a look at the year view:
  
  ![React-Calendar year view before styling](https://i.imgur.com/76QTPGA.png)
  
  So the year view could use some improvement. Since we added our own styles to the buttons, some buttons are being pushed to the next row. Similar issues occur in the decade and century views too. Luckily we can fix this like we did before by using `grid`. We'll show the list of months in a grid of 3 columns by 4 rows. The 10 buttons in the decade and century views will be in a grid of 5 columns by 2 rows.
  
  ```jsx
  const CalendarContainer = styled.div`
    /* ~~~ container styles ~~~ */
    /* ~~~ navigation styles ~~~ */
    /* ~~~ label styles ~~~ */
    /* ~~~ button styles ~~~ */
    /* ~~~ day grid styles ~~~ */
    /* ~~~ neighboring month & weekend styles ~~~ */
    /* ~~~ active day styles ~~~ */
    /* ... */
  
    /* ~~~ other view styles ~~~ */
    .react-calendar__year-view__months, 
    .react-calendar__decade-view__years, 
    .react-calendar__century-view__decades {
      display: grid !important;
      grid-template-columns: 20% 20% 20% 20% 20%;
  
      &.react-calendar__year-view__months {
        grid-template-columns: 33.3% 33.3% 33.3%;
      }
      
      .react-calendar__tile {
        max-width: initial !important;
      }
    }
  `;
  ```
  
  ![React-Calendar year view after styling](https://i.imgur.com/wPAGdiQ.png)
  
  And there we go! A React-Calendar component styled with the help of styled-components.
  
  ## Conclusion
  
  It's really easy to change the styling of the React-Calendar component, you just need to know which class selectors to use. The styles I've put together here are just one way to go about it. Once all the selectors and styles are in place, it's much easier to play around and determine what suits your project.
  
  If you want to interact with the app built out for this blog post, it is available on [GitHub](https://github.com/fitzgeraldkd/blog-posts/tree/main/react-calendar-styling/react-calendar-demo).
  
  I also have very similar styles applied to this component in an app I am currently building out, you can [check that out here](https://applitracker.netlify.app/) as well if you're interested. The app is still being developed, but here's a screenshot of what it currently looks like:
  
  ![AppliTracker demo with calendar](https://i.imgur.com/H175PmF.png)
  
  *Thanks for reading!*")

Post.create(user: kenny, title: 'Making the Most of DSA Practice', content: "The words \"data structures and algorithms\" can bring up certain feelings in many engineers. Practicing these skills can be especially daunting for newer developers preparing for technical interviews. While I am also facing this same intimidation, I've been reframing it to make it a more enjoyable experience.
  
  So instead of asking:
  
  > How can I get get through this practice?
  
  I've been asking myself:
  
  > **How can I make the most of this practice?**
  
  After changing the way I view this practice and setting up a structure for tackling these problems, I've noticed some great benefits! Not only am I more excited to work on these tasks, but I'm also using this as an opportunity to build up other skills that will help me down the line even after the technical interviews. This should not be a chore, but rather an opportunity to become a better software engineer.
  
  *Outline:*
  - [My Goals](#my-goals)
  - [My Process](#my-process)
      - [Writing Tests](#writing-tests)
      - [Writing Code](#writing-code)
      - [Refactoring](#refactoring)
  - [My Takeaways](#my-takeaways)
      - [Time and Space Complexity](#time-and-space-complexity)
      - [Test-Driven Development](#testdriven-development)
      - [General Language Familiarity](#general-language-familiarity)
  - [Conclusion](#conclusion)
  - [Resources](#resources)
  
  ## My Goals
  
  In order to get the most out of my practice, I needed to decide what I wanted to do. 
  
  - First I decided that JavaScript would be my language of choice for this practice as it's the language I think I'll be most successful with.
  - Next I decided that I want to **create my own classes** for things like stacks, trees, linked lists, etc. (data structures not available in vanilla JS).
  - Last I decided to write my own tests using a **testing framework**. 
  
  When practicing with a service like LeetCode or HackerRank, the classes and tests are usually given to you (classes are typically instantiated already for the inputs to the algorithm, and tests can be run at the click of a button with predefined test cases). While it would be quicker to rely on those, writing my own classes and tests gives me a better understanding of how data structures work and how to write effective tests.
  
  ## My Process
  
  With decisions made, I came up with a process on how I tackle an algorithm problem:
  
  - *If a new class is needed to represent a data structure I don't have:*
      1. Write tests for the class and its methods
      1. Write the code for the class and its methods, testing along the way
      1. Refactor until satisfied with the code
      1. Think of new edge cases, write additional tests as needed, and repeat!
  
  
  - *For the algorithm:*
      1. Write tests for the algorithm
      1. Write code to solve the algorithm, testing along the way
      1. Refactor until satisfied with the code
      1. Think of new edge cases, write additional tests as needed, and repeat!
  
  Notice how both lists are nearly identical? That wasn't an accident, and we'll look a little bit into how this ties into **test-driven development**!
  
  ### Writing Tests
  
  First you need to determine what needs to be tested. If you're building a class, what methods are needed? If you're writing an algorithm, what are some different test cases that you need to anticipate? If you're working on a task assigned to you, read the deliverables **carefully**. Make sure you have a solid understanding of what is expected before you write anything.
  
  Next, what are the expected inputs and outputs? For example, say we are building a Stack class (a [last-in-first-out data structure](https://www.tutorialspoint.com/data_structures_algorithms/stack_algorithm.htm)). When we run the `pop` method there are two separate actions that should happen:
  
  1. The top element should be removed from the stack
  1. The value of the top element should be returned
  
  Once you know what your code is expected to do, you can start writing tests. The tests will fail for now since none of the code has been written yet, but that's part of the process! Here's what those tests could look like:
  
  ```jsx
  describe('Can pop from Stack', () => {
    test('Pop removes the top item from the stack', () => {
      const stackToPop = new Stack('foo');
      stackToPop.push('bar');
  
      // verify before popping: stackToPop.top.value === 'bar'
      expect(stackToPop.top.value).toBe('bar');
      stackToPop.pop();
  
      // verify after popping: stackToPop.top.value === 'foo'
      expect(stackToPop.top.value).toBe('foo');
    });
    test('Pop returns the value of the returned item', () => {
      const stackToPop = new Stack(42);
  
      // verify: stackToPop.pop() === 42
      expect(stackToPop.pop()).toBe(42);
    });
  });
  ```
  
  > Note: I used [Jest](https://jestjs.io/) as my testing framework, though there are many options out there and the process should be similar regardless.
  
  One of my favorite things about using a test framework is that tests can be automatically re-run every time the files are saved. As I'm coding, I keep an eye on the terminal in case any changes I made have unexpected results (good or bad).
  
  The full test code I wrote can be viewed in [this GitHub repository](https://github.com/fitzgeraldkd/blog-posts/blob/main/making-the-most-of-dsa-practice/examples/Stack.test.js).
  
  ### Writing Code
  
  The time it takes to write tests can give you some time to think about the task at hand and ponder possible solutions. By the time I finish writing tests I typically have an idea of how to start my code, but if not I take more time to think on it. For complex problems, it may help to draw some diagrams, sketching out notes, or maybe implement [rubber duck debugging](https://rubberduckdebugging.com/)! *Pair programming with a human is an acceptable substitute if a duck is not available.* If the tests can be tackled piecemeal, focus on one task at a time to get closer to your end goal.
  
  Let's say I'm working on the `pop` method of the stack class that we wrote tests for above. This method has two separate tests it needs to pass. For the first test we need to remove the top item of the stack, so let's start there: 
  
  ```jsx
  class Stack {
    /* ... */
  
    pop() {
      this.top = this.top.next;
    }
  
    /* ... */
  }
  ```
  <figcaption>The pop method will now pass the first test</figcaption>
  
  The code above replaces the top item with the next item in the stack. That's all that's needed to remove the top item so we've passed the first test! We're still failing the second test though. To pass the next test we need to return the value of the top item, so we just need to add a couple more lines to the method we just started:
  
  ```jsx
  class Stack {
    /* ... */
  
    pop() {
      const poppedItem = this.top.value;
      this.top = this.top.next;
      return poppedItem
    }
  
    /* ... */
  }
  ```
  <figcaption>The pop method will now pass both tests</figcaption>
  
  After I have working code, I will take a closer look at the time and space complexity. While I try to be mindful of this throughout the process, sometimes it's more important to get the code functional first before optimizing it. That's where refactoring comes in!
  
  The full code for this class I wrote can be viewed in [this GitHub repository](https://github.com/fitzgeraldkd/blog-posts/blob/main/making-the-most-of-dsa-practice/examples/Stack.js).
  
  ### Refactoring
  
  After I get my code to work, I take a second look at my process and look for improvements. Are there variables I've assigned that are unnecessary? Is my time complexity reasonable for the task? Are there any **edge cases** that I haven't considered? Refactoring gets easier with practice, and sometimes the improvements may not be obvious right away. If you're not on a time crunch, this may be a good opportunity to step away from the code for a minute!
  
  One important thing to keep in mind when optimizing your code is that it is very rare for there to be a single optimal case. For example, below is a table summarizing a couple ways to optimize a simple algorithm that checks if all the items in an **unsorted array** are unique:
  
  |             | Time Complexity | Space Complexity |
  |:-----------:|:---------------:|:----------------:|
  | Optimizing Time | `O(n)` | `O(n)` |
  | Optimizing Space | `O(n log n)` | `O(1)` |
  
  For this algorithm, you could decide to *optimize time* by iterating through the array just one time and creating a hash to ensure no value exists more than once. You could also *optimize space* by sorting the array in-place first (perhaps with [heapsort](https://en.wikipedia.org/wiki/Heapsort)), then iterating through the array once and seeing if any two consecutive items are identical.
  
  There are often **trade-offs** between optimizing time or space complexity. The goal should be to keep both at a minimum wherever possible, but sometimes decisions need to be made on which is the priority. When I'm practicing, I will sometimes solve an algorithm multiple times trying to optimize different aspects. Luckily the same tests can be used for both solutions!
  
  ## My Takeaways
  
  ### Time and Space Complexity
  
  This is probably the most obvious skill that is developed from these exercises. Writing code that works is (*relatively*) easy; writing code that works *efficiently* is much more challenging. Starting with a brute-force algorithm will get the job done, but **developing that awareness for when code feels inefficient is crucial**. I find it easier to determine the time and space complexities of algorithms now that I've been practicing more, as well as possible routes to improve them.
  
  ### Test-Driven Development
  
  Before starting my practice here I had very little experience writing tests. I know test-driven development is common and provides a lot of benefits, so I was looking for opportunities to get some exposure to working with tests. The processes I described earlier for writing a data structure class or an algorithm is taken from the **red, green, refactor** process that guides test-driven development:
  
  1. Red: write tests (no code has been written yet, so these tests should fail)
  1. Green: write code to get the tests to pass
  1. Refactor: improve/optimize the code you've written
  
  Refactoring isn't necessarily the end of the process. Sometimes after the code is optimized for the tests already in place, more tests should be added for any additional edge cases. Or maybe there's additional features that can be implemented. That's why this process is typically shown as a cycle:
  
  ![Red, Green, Refactor process](https://i.imgur.com/5BxpMxZ.jpg)
  
  For example, there's an important edge case to consider with the `pop` method we walked through: what happens when you run the `pop` method on an **empty stack**? This would be a good opportunity to think about what you want to happen in this case. Should an error be raised, or should the method just return `null`? Determine what the method should do, and start the cycle again by writing more tests!
  
  ### General Language Familiarity
  
  Of course writing code of any kind will help you get more familiar with the language! With the process I've set for myself, I find myself noticably improving in these areas (among others):
  
  - Creating classes
  - Writing tests
  - Using built-in methods for strings, numbers, arrays, objects, etc.
  
  ## Conclusion
  
  Preparing for technical interviews is a challenge for most (if not all) newer software engineers, myself included. As I continue to practice I will still come across questions that *throw me for a loop*. However with a structure set up for myself to approach these problems I feel much more empowered to face them knowing that I'm developing skills that will help me even beyond the technical interview.
  
  If you want to see the tests I wrote in action, I have the files and instructions available [here](https://github.com/fitzgeraldkd/blog-posts/tree/main/making-the-most-of-dsa-practice/examples) on how to run them.
  
  What else do you do to make the most out of this practice? 
  
  *Thanks for reading!*
  
  ## Resources
  
  - [Big O Cheat Sheet](https://www.bigocheatsheet.com/)
  - [Test-Driven Development](https://www.agilealliance.org/glossary/tdd)")

Post.create(user: kenny, title: 'Building a Dot Matrix Animator', content: "Whenever I start learning a new skill, I like to come up with a project I can use to apply the skill, test my knowledge, and push myself to find areas where I need to improve. As helpful as tutorials and walkthroughs are, I find that I always get the most experience when I can struggle through a project I start from scratch and apply the knowledge I've learned without explicit instructions. I decided to write this blog about my first Ruby project because I really enjoyed this project and think the results are pretty cool! I won't get into the details about the code here, but it is all available on my [GitHub](https://github.com/fitzgeraldkd/dot-matrix)!
  
  ## The Idea
  
  The idea I came up with was to write a program that creates a dot matrix animation based on input images. Here were my goals for the project:
  
  - The user can provide any number of images for the animation
      - Each image acts as a [keyframe](https://en.wikipedia.org/wiki/Key_frame) in the animation
  - The user can specify the size of the dot matrix (rows, columns, and dot size)
  - The user can specify how long each keyframe is displayed, as well as how long the transition between keyframes lasts
  - The user will receive an animation based on the inputs where dots are rendered on each frame with a size that relates to the pixel's color
  
  For the purpose of having a set of images to start with, I made some simple, bitonal, vector images of my initials. I will be using these three images as the keyframes for my test animation.
  
  ![My initials as keyframes](https://i.imgur.com/6WDhHC0.png)
  
  ## The Implementation
  
  Before writing the code, I wanted to come up with a plan so I could determine which tools I should implement. Here's what I came up with:
  
  - **Process** the input images
      - *Reduce the image size* down to the dot matrix size so one pixel is represented by one dot (processing a full-size image would take longer, use more memory, and provide no benefit)
      - For each pixel in the image, *determine the size* a dot would need to be to represent a close approximation of the shade/tint
  - **Interpolate** between keyframes so the dots' sizes transition smoothly
  -  **Generate frames** of the GIF animation
      - *Render a dot* for each pixel with a size based on the pixel's color
  - **Save** the final GIF file
  
  ### *Processing the Input Images*
  
  To accomplish this project, I knew I would need some way to process the input images. Resizing the images was the easy bit. The more complex (and more important) task was to find the best way to relate a pixel's color in the source image to a dot's size in final animation. I felt that the **relative luminance** as described [in this W3 accessibility document](https://www.w3.org/TR/WCAG/#dfn-relative-luminance) was a logical property to use in this case, and can be easily calculated with a color's RGB components. After determining what tasks I needed to fulfill, I determined that the [RMagick library](https://rmagick.github.io/) would be a good choice for this project.
  
  ### *Rendering a GIF*
  
  Since I already decided to use RMagick to process the images, it makes sense to continue using it to generate a new GIF file for the animation as well. Luckily most of the process is pretty straightforward:
  
  - **Create an instance** of the `ImageList` class (a class defined in the RMagick library) to hold each frame of the animation
  - **For each frame**:
      - *Create an instance* of the `Image` class (also from RMagick)
      - Provide a *background color*
      - For each pixel/dot:
          - *Draw a circle* in the corresponding location with a radius determined by the relative luminance
      - *Add* the `Image` instance to the `ImageList`
      - *Provide a duration* for how long the `Image` just added should last (this allows us to pause longer on a keyframe compared to the transitional/animation frames)
  - **Save** the `ImageList` instance to a `.gif` file
  
  The more challenging piece is the **transition between keyframes**. To do this, I decided to write a method that would generate a new, weighted average image between two keyframes. As time progresses, the weight will shift towards the end keyframe to allow me to interpolate and generate a frame *at any point in time*. This new image can then be processed just like the keyframes. Below is an image demonstrating what I need to accomplish:
  
  ![Transitioning between two keyframes](https://i.imgur.com/905DSal.png)
  
  With any of these transitional images a new frame can be processed to create a frame of the dot matrix animation.
  
  ## The Classes
  
  With a library selected and a plan set, I had to determine how to actually write the program. Leaning more towards an object-oriented approach, I decided I wanted to use three classes:
  
  - An `Animation` class that holds most of the information/logic for the animation as a whole
  - A `Frame` class that holds the data for a single image in the animation
  - A `Dot` class that holds the information for a single dot/pixel in an image
  
  When the program is initiated, it creates an instance of the `Animation` class. It then resizes all of the input images down to the desired dot matrix size and adds them to an array in the `Animation` instance. The next step is to create `Frame` instances for each keyframe and all the transitional frames. Then each pixel of each `Frame` is used to instantiate a `Dot`, which is then used to render the animation. This is a bit of a simplification, but the source code is available on my [repository on GitHub](https://github.com/fitzgeraldkd/dot-matrix) for those who want to dive a little deeper!
  
  ## The Interface
  
  I wanted to provide a command-line interface for the user that was **easy to use**, and I also wanted to provide the **flexibility** with the options used to render the animation. After looking around online I found that [Thor](https://github.com/rails/thor) was a good tool to utilize. It allowed me to easily create a number of options that make this program much more versatile. An example below shows how a user can select which folder the source images are in, as well as what the background and foreground colors should be:
  
  ```bash
  bin/run render_gif --subfolder=demo --bg_color=black --fg_color=red
  ```
  
  There are more options than that as well, and a default value is provided for each one. There is also a separate Ruby file that holds all the defaults to make it easy for a user to set their own preferences.
  
  ## The Results
  
  I'm really proud of the results! I was able to get the program to do exactly what I was looking for, and I enjoy seeing the animation. For the first example, here are three images I used as keyframes: one image for each of my initials.
  
  ![My initials as keyframes](https://i.imgur.com/6WDhHC0.png)
  
  After using these images in the script, here is the animation I got:
  
  ![Dot matrix animation of my initials](https://i.imgur.com/zEfihJk.gif)
  
  Awesome! After seeing the results for a very simple bitonal image, I wanted to see how it looked for more complex examples. I decided to generate a static dot matrix with a width of 100 pixels for these examples. I used [this black & white photo of the Eiffel Tower](https://unsplash.com/photos/MGDIKg9Bw5U) by Lisa BR on Unsplash and ran my script to see some nice results: 
  
  ![Dot matrix of a photo of Paris](https://i.imgur.com/mV3w35E.png)
  
  I also tried it out on [this photo of a dog and a pumpkin](https://unsplash.com/photos/3v9CFkIKw_c) by Nathan Guzman on Unsplash and saw similarly promising results:
  
  ![Dot matrix of a photo of a dog and a pumpkin](https://i.imgur.com/HrvseLH.png)
  
  Obviously a lot of detail was lost since the original pictures were almost 2000 pixels in width each and were being reduced to 100 pixels (also all color is removed), but all things considered I think the results are great! The pumpkin next to the dog may not be recognizeable at this resolution and with the absense of color, but other than that both images still retain enough detail to be made sense of.
  
  ## The Future
  
  Here's a few things I'd like to add in the future:
  
  - Have the foreground/background colors be dynamically set by the dominant colors in the source image
  - Provide the option to generate an SVG instead of (or in addition to) a GIF
  - Allow an animated GIF to be an input image and have each frame be processed (it currently reads only a single frame from animated GIFs)
  
  I hope you found this project as interesting as I did! I had a lot of fun making it and feel a lot more comfortable with Ruby's syntax after going through it. *Thanks for reading!*")

  Post.create(user: kenny, title: "Object References (Why ['this']!==['this'])", content: "If you run `console.log(['this'] === ['this'])` in JavaScript, what would you expect to see? Well it would be perfectly rational to expect that `true` would be the result, but instead we see `false`. Let's take a look at a few tests:
    
    ```jsx
    // Control Test
    console.log('this' === 'this');
    // => true
    
    // Test 1
    console.log(['this'] === ['this']);
    // => false
    
    // Test 2
    const arr1 = ['this'];
    const arr2 = ['this'];
    console.log(arr1 === arr2);
    // => false
    
    // Test 3
    const arr3 = ['this'];
    const arr4 = arr3;
    console.log(arr3 === arr4);
    // => true
    ```
    
    Our control test directly comparing two identical strings returns `true` as expected. The first two tests comparing seemingly identical arrays log `false`, but the third logs `true`. So what's really going on here? Let's take a look at how JavaScript assigns different data types to variables.
    
    ## Data Types
    
    ### Primitive
    
    This potentially unexpected behavior will only occur for certain data types. In JavaScript, data can be classified as either primitive values or objects. [Primitive](https://developer.mozilla.org/en-US/docs/Glossary/Primitive) types include string, number, bigint, boolean, undefined, symbol, and null. When you assign a primitive type to a variable, the variable contains the value itself. This allows us to compare two primitive values and intuitively expect the correct response.
    
    ```jsx
    console.log('this' === 'this');
    // => true
    
    console.log(1 === 1);
    // => true
    
    console.log(true === true);
    // => true
    
    const myString1 = 'this';
    const myString2 = 'this';
    console.log(myString1 === myString2);
    // => true
    ```
    
    ### Objects
    
    Non-primitive data types behave differently. These data types are classified as [objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#objects) and include things like objects, arrays, and functions: data types that store a collection of values. Per MDN, regarding why functions and arrays are included in the category of *objects*:
    
    > [Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#normal_objects_and_functions) are regular objects with the additional capability of being *callable*.
    
    > [Arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#indexed_collections_arrays_and_typed_arrays) are regular objects for which there is a particular relationship between integer-keyed properties and the `length` property.
    
    When you assign these data types to a variable, the collection itself is not stored into the variable. Instead, a reference to the collection is stored. Let's take a closer look at one of the tests from earlier:
    
    ```jsx
    const arr1 = ['this'];
    const arr2 = ['this'];
    console.log(arr1 === arr2);
    // => false
    ```
    
    In this example when `arr1` is assigned, the array `['this']` is stored somewhere in memory, and the variable itself is now the address of the memory location. When `arr2` is initialized, the array is stored into another location in memory (separate from the first array) and this second address is stored in the variable. Since `arr1` and `arr2` have two separate addresses to two separate arrays, comparing the two variables will result in `false`.
    
    ![Diagram showing why arr1 and arr2 are not equal](https://i.imgur.com/TmVK9r0.png)
    
    Let's look at another example:
    
    ```jsx
    const arr3 = ['this'];
    const arr4 = arr3;
    console.log(arr3 === arr4);
    // => true
    ```
    
    Here we are assigning `arr3` to `arr4`. By doing this, both variables are pointing to the same array in memory. Both variables have the address to the same array in memory, so comparing the two variables will result in `true`.
    
    ![Diagram showing why arr3 and arr4 are equal](https://i.imgur.com/g2ZSheO.png)
    
    The examples here covered arrays, but this principle also applies to other non-primitive data types:
    
    ```jsx
    const obj1 = {this: 'that'};
    const obj2 = {this: 'that'};
    console.log(obj1 === obj2);
    // => false
    
    const obj3 = {this: 'that'};
    const obj4 = obj3;
    console.log(obj3 === obj4);
    // => true
    
    const func1 = () => {};
    const func2 = () => {};
    console.log(func1 === func2);
    // => false
    
    const func3 = () => {};
    const func4 = func3;
    console.log(func3 === func4);
    // => true
    ```
    
    ## Destructive Modifications
    
    There's another important concept to understand that builds off of the fact that variables that store references to objects in memory. Since multiple variables can point to the same data in memory, it is important to exercise caution when making **destructive modifications**. Take a look at this example:
    
    ```jsx
    const arr3 = ['this'];
    const arr4 = arr3;
    arr4[0] = 'that';
    console.log(arr3);
    // => ['that']
    console.log(arr4);
    // => ['that']
    ```
    
    In the example both `arr3` and `arr4` are pointing to the same array in memory. When an element in `arr4` is changed, it changes the array in the memory. Since both variables point to the same array in memory, this change can be seen by logging `arr3` even though `arr3` was not directly modified. This example directly modified an element in the array, but it's important to note that **many array and object methods are destructive and modify the original object**. I recommend reviewing the documentation for [arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) and [objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) if you need to know which methods are destructive.
    
    If you need to assign an array or object to a new variable and make modifications without affecting the original, then you need to make a copy. If there's only a single level of data, a shallow copy will suffice and is easy to accomplish. With ES6, a shallow copy can be quickly created with the spread operator (`...`):
    
    ```jsx
    const arr5 = [1, 2, 3];
    const arr6 = [...arr5];
    console.log(arr5 === arr6);
    // => false
    arr6[1] = 'b';
    console.log(arr5);
    // => [1, 2, 3]
    console.log(arr6);
    // => [1, 'b', 3]
    ```
    
    Since we made a copy, `arr5` and `arr6` now point to two different arrays in memory. We can confirm this by comparing the two arrays and logging the result (`false`). Changes can be made to the array associated with one variable without affecting the other.
    
    ## Deep Objects
    
    Objects with nested levels are a little more complex. We can still create a shallow copy to separate the top level elements, but anything nested inside will be kept as a reference to some object in memory. Here's a demonstration:
    
    ```jsx
    const arr7 = [1, 2, [3, 4]];
    const arr8 = [...arr7];
    console.log(arr7 === arr8);
    // => false
    console.log(arr7[2] === arr8[2]);
    // => true
    arr8[1] = 'b';
    arr8[2][1] = 'd';
    console.log(arr7);
    // => [1, 2, [3, 'd']]
    console.log(arr8);
    // => [1, 'b', [3, 'd']]
    ```
    
    So we can demonstrate that `arr7` and `arr8` are pointing to two different arrays with the first `console.log`. However, when we compare the sub-array at index 2 in each array, we find that they are both pointing to the same array in memory. Mutating elements in the top level of one array will not affect the other, but mutating elements in the sub-array will affect **both**. This may be a little confusing, so here's a simple diagram:
    
    ![Diagram showing how arr7 and arr8 point to two separate arrays but have a shared sub-array](https://i.imgur.com/FJ5Nw2g.png)
    
    Both variables point to a different array at the top level, but these two arrays still point to the same array for one of the elements. To completely separate our two variables we will need to make a deep copy. 
    
    ## Deep Copying
    
    ### With JSON
    
    There are a few ways to make a deep copy of an object or array. One way is to use the JSON `stringify` and `parse` methods:
    
    ```jsx
    const arr9 = [1, 2, [3, 4]];
    const arr10 = JSON.parse(JSON.stringify(arr9));
    console.log(arr9 === arr10);
    // => false
    console.log(arr9[2] === arr10[2]);
    // => false
    arr10[1] = 'b';
    arr10[2][1] = 'd';
    console.log(arr9);
    // => [1, 2, [3, 4]]
    console.log(arr10);
    // => [1, 'b', [3, 'd']]
    ```
    
    This works well enough in many situations, but it doesn't perfectly copy all data types. Any `undefined` values in the object will be replaced with `null`. In addition, any `Date` objects will be converted to a string representation. So the copied array will be completely independent of the original, but it may not be an *exact* copy.
    
    ```jsx
    // undefined values are replaced with null
    console.log(JSON.parse(JSON.stringify([undefined])));
    // => [null]
    ```
    
    ```jsx
    // Date objects are replaced with the string representation
    const myDate = new Date();
    console.log(typeof myDate);
    // => object
    const myDateCopy = JSON.parse(JSON.stringify(myDate));
    console.log(typeof myDateCopy);
    // => string
    ```
    
    ### With Libraries
    
    Some JavaScript libraries provide methods on creating deep copies. One example of this would be the [lodash `cloneDeep` method](https://lodash.com/docs/4.17.15#cloneDeep). If you're using a library that has a method like this, check the documentation to ensure it works the way you need it to.
    
    ### With Recursion
    
    You can build your own function to make a deep copy as well! Here's a recursive function I've written to do this:
    
    ```jsx
    function deepCloner(target) {
      if (Array.isArray(target)) {
        return target.map(deepCloner);
      } else if (target instanceof Date) {
        return new Date(target);
      } else if (typeof target === 'object' && target !== null) {
        const newObj = {};
        for (const key in target) {
          newObj[key] = deepCloner(target[key])
        }
        return newObj;
      }
      return target;
    }
    ```
    
    To explain what it's doing:
    
    1. If the input is an array, iterate through the array with the `map` method, pass each element into the `deepCloner` function recursively, and return a new array.
    1. If the input is a date object, create a copy of the date object with `new Date()`.
    1. If the input is an object (but not the value `null`), iterate through the key/value pairs and pass the values recursively into the `deepCloner` function.
    1. If the input does not meet any of the above criteria, return the input itself without modification.
    
    I believe this function should be suitable for most situations, but there could be other edge cases that I don't have accounted for yet. One such situation I can think of is if a function reference is stored in the original object. The deep copy will still reference the same function in memory, though I don't foresee this being an issue. Leave a comment if you can think of any data types that this may not cover! I've also included a Replit at the bottom of this post that shows this function in action.
    
    ## Conclusion
    
    The way objects are referenced in variables may not be intuitive for newcomers to JavaScript. The first time I noticed that changing an element in an array associated with one variable could affect other variables I was completely dumbfounded. Without knowing what JavaScript does behind the scenes with objects, it's difficult to get a grasp on why some of these behaviors occur. Now that I have a better understanding of why this happens, it's much easier for me to write code to avoid this from being an issue. Hopefully this helps you too! *Thanks for reading!*
    
    {% replit @fitzgeraldkd/DeepClonerDemo %}")

    Post.create(user: kenny, title: "Navigating Complex Objects", content: "When you're just starting off in coding, the concept of nested objects and accessing their properties can be difficult to grasp. Seeing a complicated object with multiple levels of depth can be intimidating at first, but working with these kinds of objects is an important skill to develop. When retrieving information from databases and APIs, the results are often packaged in a **JSON** ***(JavaScript Object Notation)*** object that has many levels of nested objects. Understanding how to navigate these objects will be crucial when working with this kind of data. This post is written for those who are new to working with objects and are looking for a breakdown on how to access a property multiple layers deep in nested objects.
    
    ## The Sample Data
    
    For the purpose of the examples here, we'll be looking at some real world *(and beyond)* data provided by NASA. There are a number of free APIs from NASA that are available for anyone to access, so this will be a good example of what a complex object could look like in a real application. Our sample data will be fetched from the [Asteroids - NeoWs](https://api.nasa.gov/#asteroids-neows) API which provides information about near-Earth asteroids. Below I have included a simplified *JSON schema* of the dataset that shows the organizational structure without the actual data. 
    
    ```json
    // Simplified JSON schema for fetchResults
    {
      \"links\": {},
      \"element_count\": 0,
      \"near_earth_objects\": {
        \"yyyy-mm-dd\": [
          {
            \"links\": {},
            \"id\": \"\",
            \"neo_reference_id\": \"\",
            \"name\": \"\",
            \"nasa_jpl_url\": \"\",
            \"absolute_magnitude_h\": 0,
            \"estimated_diameter\": {},
            \"is_potentially_hazardous_asteroid\": true,
            \"close_approach_data\": [],
            \"is_sentry_object\": true
          }
        ]
      }
    }
    ```
    
    **A couple of things to note**:
    - There could be any number of key/value pairs under `near_earth_objects`, depending on how many days of data is requested through the API.
    - The values associated with each date key are arrays, and these arrays can also contain any number of items.
    
    If you are interested in seeing the actual JSON object, [here is the sample data](https://github.com/fitzgeraldkd/blog-posts/blob/main/navigating-objects/sample-data.json) that I fetched with the API. The examples below will assume that a variable `fetchResults` has already been declared and that these results have already been assigned to it. There are two dates included in the results: `\"2015-09-07\"` (with 13 objects), and `\"2015-09-08\"` (with 11 objects).
    
    
    ## Accessing the Data
    
    Let's say we wanted to read the `is_potentially_hazardous_asteroid` property of the first element associated with the date `\"2015-09-07\"`. How do we go about doing it? Well we have to navigate down through each level in the object, working our way through the nested objects to find the specific property we're trying to reach. Here's how you can do it in JavaScript:
    
    ```jsx
    // JavaScript
    //           ┌ access the 'near_earth_objects' object
    //           │                 ┌ access the array associated with the desired date
    //           │                 │             ┌ acccess the first object in the array
    //           │                 │             │   ┌ access the desired property
    fetchResults.near_earth_objects['2015-09-07'][0].is_potentially_hazardous_asteroid;
    // => false
    ```
    
    All right! So we got the property we were looking for and it returns the expected value of `false`, but how does this all work? Let's break this down:
    1. `fetchResults` is the object returned from the API request as described above.
    1. `.near_earth_objects` accesses the object that contains all the dates.
    1. `['2015-09-07']` accesses the array of objects for the desired date. Note that **bracket notation is required** here for two reasons:
        - The key starts with a number.
        - The key contains a hyphen.
    1. `[0]` accesses the first object of the array. **Bracket notation is required** here since we are retrieving an element inside an **array** instead of a property in an object.
    1. `.is_potentially_hazardous_asteroid` finally gets us to the property we wanted to retrieve.
    
    **Why can't we just do the following?**
    
    ```jsx
    // JavaScript
    fetchResults.is_potentially_hazardous_asteroid;
    // => undefined
    ```
    
    Well the `fetchResults` object only has three keys: `links`, `element_count`, and `near_earth_objects`. Accessing any other key will return `undefined` since an object does not have immediate access to the keys in any children objects. The property we're trying to get to is four levels deep in the `fetchResults` object, so we have to use [**property accessors**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) four times in order to get to it.
    
    *Side note*: Accessing this property can also be done purely with **bracket notation** as shown below, however I prefer using **dot notation** where possible for its readability.
    
    ```jsx
    // JavaScript
    fetchResults['near_earth_objects']['2015-09-07'][0]['is_potentially_hazardous_asteroid'];
    // => false
    ```
    
    ## Visualizing the Data
    
    When you're first learning about objects, accessing these nested properties can seem abstract and might be a hard concept to grasp. Another way to visualize this may be to **imagine this object as a folder tree** on your computer. When you want to access a file, you sometimes have to navigate through *multiple levels of directories* first. For each level of arrays/objects nested within the main object, imagine another subfolder with its own contents. When you're in the top level directory, you don't have immediate access to files in any of the sub-directories. 
    
    For the purpose of demonstration, I have created a *mockup set of folders* to mirror the structure of the `fetchResults` object. Below is the output of running the `tree` command in the terminal for these directories. 
    ```bash
    # bash
    $ tree fetchResults
    fetchResults
    ├── element_count
    ├── links
    │   ├── next
    │   ├── prev
    │   └── self
    └── near_earth_objects
        ├── 2015-09-07
        │   ├── 0
        │   │   ├── absolute_magnitude_h
        │   │   ├── close_approach_data
        │   │   │   ├── close_approach_date
        │   │   │   ├── close_approach_date_full
        │   │   │   ├── epoch_date_close_approach
        │   │   │   ├── miss_distance
        │   │   │   │   ├── astronomical
        │   │   │   │   ├── kilometers
        │   │   │   │   ├── lunar
        │   │   │   │   └── miles
        │   │   │   ├── orbiting_body
        │   │   │   └── relative_velocity
        │   │   │       ├── kilometers_per_hour
        │   │   │       ├── kilometers_per_second
        │   │   │       └── miles_per_hour
        │   │   ├── estimated_diameter
        │   │   │   ├── feet
        │   │   │   │   ├── estimated_diameter_max
        │   │   │   │   └── estimated_diameter_min
        │   │   │   ├── kilometers
        │   │   │   │   ├── estimated_diameter_max
        │   │   │   │   └── estimated_diameter_min
        │   │   │   ├── meters
        │   │   │   │   ├── estimated_diameter_max
        │   │   │   │   └── estimated_diameter_min
        │   │   │   └── miles
        │   │   │       ├── estimated_diameter_max
        │   │   │       └── estimated_diameter_min
        │   │   ├── id
        │   │   ├── is_potentially_hazardous_asteroid
        │   │   ├── is_sentry_object
        │   │   ├── links
        │   │   │   └── self
        │   │   ├── name
        │   │   ├── nasa_jpl_url
        │   │   └── neo_reference_id
        │   └── ...
        └── ...
    ```
    
    See how the structure here is nearly identical to the structure of the object? The process of retrieving a file in this folder structure is very similar to that of retrieving a property in the object. In JavaScript you use dot and/or bracket notation to access a property of an object. In Bash or your file explorer you use `/` to access a subfolder.
    
    ```jsx
    // JavaScript
    // accessing a property in a series of nested objects
    fetchResults.near_earth_objects['2015-09-07'][0].is_potentially_hazardous_asteroid;
    ```
    
    ```bash
    # bash
    # accessing a file in series of nested folders
    fetchResults/near_earth_objects/2015-09-07/0/is_potentially_hazardous_asteroid
    ```
    
    For a more visual example see below for an example of navigating through the mockup folder set up to match the structure of `fetchResults`. When you're trying to access a property that is multiple levels deep in an object, imagine that you are navigating a folder structure to get to the information you're looking for.
    
    ![Animation demonstrating navigating through nested directories](https://i.imgur.com/quJB88C.gif \"Animation demonstrating navigating through nested directories\")
    
    ## Wrapping Up
    
    Hopefully this brief explanation provides some clarity into navigating through nested objects! It may be intimidating at first, but it's an important skill to develop. **Objects with this level of complexity are common** and they can be structured in countless different ways. When you get data from an API, you may not have much (or any) control on how the data is formatted as you receive it. Being familiar with how to access the different properties will be a big help as you start to work with complex datasets. *Thanks for reading!*")