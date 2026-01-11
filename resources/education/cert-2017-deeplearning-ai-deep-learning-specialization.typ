// resources/education/cert-2017-deeplearning-ai-deep-learning-specialization.typ
// Deep Learning Specialization - deeplearning.ai

#let certificate = (
  type: "certificate",
  name: "Deep Learning Specialization",
  provider: "deeplearning.ai",
  platform: "Coursera",
  instructor: "Andrew Ng",
  completion_date: "Oct. 2017",
  
  // Description
  description: "5-course specialization covering neural networks, CNNs, RNNs, and deployment strategies",
  
  // Projects (from ATS_CV.tex)
  projects: (
    "Image Recognition with Convolutional Neural Networks",
    "Speech Detection and Recognition with RNNs",
    "Trigger Word Detection System",
    "Neural Style Transfer",
    "Generative Adversarial Networks (GANs)",
  ),
  
  // Skills Learned
  skills: (
    "Deep Learning",
    "Neural Networks",
    "TensorFlow",
    "Keras",
    "CNNs",
    "RNNs",
    "LSTMs",
    "GANs",
    "Transfer Learning",
  ),
  
  // Tags
  tags: ("ml", "deep-learning", "certification", "coursera", "tensorflow", "keras", "neural-networks", "ai", "online-course"),
  
  // Relevance Scores (1-10 scale)
  relevance: (
    "ml-engineering": 10,
    "data-science": 9,
    "ml-researcher": 7,
    "applied-scientist": 9,
    "software-engineering": 6,
    "data-analyst": 3,
    "research": 6,
    "mlops-engineer": 8,
    "ai-researcher": 8,
  ),
  
  // Optional fields
  credential_url: none,
  duration_hours: 120,
)
