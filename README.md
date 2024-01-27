# Noor: A Platform for Quranic Text Analysis 

 <p align="center"> 
 <img src = "https://raw.githubusercontent.com/NoorBayan/Noor/main/image/Logo.jpg" width = "200px"/>
 </p>
 

*Noor نور* is a platform for Quranic text analysis. The main idea behind it is to provide application programming interfaces (APIs) for the analysis of the entire Quranic text. These APIs are able to provide interfaces for the following functions:

* Morphological analysis of Quranic text
* Extraction of all different morphological properties
* Dependency-constituency hybrid syntactic analysis of Quranic text
* Visual representation of syntactic analysis
* Extraction of semantic relations
* Explaining the meanings of Quranic vocabulary for children 

 <p align="center"> 
 <img src = "https://github.com/NoorBayan/Noor/blob/main/image/FrameWork.jpg" width = "800px"/>
 </p>

These sets of APIs are valuable for different research communities, including researchers, developers, and learners.

## Noor APIs

### Morphological Analysis APIs
In the morphological analysis API, the Quranic sura and ayah are specified to give detailed information about the morphological analysis of the relevant Quranic ayahs. The API helps to identify the morphological richness of the Quran.

 <p align="center"> 
 <img src = "https://github.com/NoorBayan/Noor/blob/main/image/MorphAnalysisUC.jpg" width = "800px"/>
 </p>

### Morphological features Extraction APIs
The morphological features extraction API provides multiple options through which morphological properties can be specified.

 <p align="center"> 
 <img src = "https://raw.githubusercontent.com/NoorBayan/Noor/main/image/FeaturesExtraction.png" width = "800px"/>
 </p>

#### Word Formation:
Derivation: Root letters combine to form verbs and related words with nuanced meanings.
Suffixes: Three types are attached: determiners, vocatives, and future particles.
Attached pronouns: Indicate possession or act as subject/object pronouns.
Nūn of emphasis: Adds emphasis to a word.

#### Verbs:
- *Aspect:* Describes completeness of an action (perfect, imperfect, imperative).
- *Mood:* Indicates how the action is presented (indicative, subjunctive, jussive).
- *Verb voice:* Active or passive
- *Special groups:* "Kan wa-akhwatuha" (incomplete verbs), "Kad wa-akhwatuha" (verbs of approach), "ʾin wa-akhwatuha" (particles of affirmation).

#### Nouns:
- *Definiteness:* Marked with article "al" (definite) or tanwīn (indefinite).
- *Case:* Nominative, accusative, and genitive to define roles in sentences.
- *Derived nouns:* Formed from verbs carrying verb information (active/passive participles, verbal nouns).

#### Additional Features:
* *Person:* Indicating who performs the action (first, second, third).
* *Gender:* Masculine or feminine for each noun.
* *Number:* Singular, dual, or plural for each noun.



### Dependency-Constituency Hybrid Syntactic Analysis APIs

The dependency-constituency hybrid syntactic analysis APIs provide a comprehensive set of tools and resources for analyzing the syntactic structure of Quranic verses. These APIs are able to analyze the syntactic structure of Quranic verses in a variety of ways, including:

- Processing of elliptical structure
- Generating a hybrid dependency-constituency representation
- Visualizing the syntactic structure

 <p align="center"> 
 <img src = "https://raw.githubusercontent.com/NoorBayan/Noor/main/image/Parsing_Framework.jpg" width = "800px"/>
 </p>

#### Elliptical structure

The APIs are able to process elliptical structure in Quranic verses. This is important for providing a more accurate and complete analysis of the syntactic structure of Quranic verses.

 <p align="center"> 
 <img src = "https://github.com/NoorBayan/Noor/blob/main/image/EellipticalStructure.jpg" width = "800px"/>
 </p>

#### Hybrid Dependency-Constituency Representation
The APIs generate a hybrid dependency-constituency representation of the syntactic structure of Quranic verses. This representation is a combination of dependency and constituency analysis. It is a more comprehensive representation that can capture the full range of syntactic relationships in Quranic verses.

 <p align="center"> 
 <img src = "https://raw.githubusercontent.com/NoorBayan/Noor/main/image/DependencyConstituency.png" width = "600px"/>
 </p>
 
#### Visualization

The APIs also provide a visualization of the syntactic structure of Quranic verses. This visualization can be helpful for understanding the relationships between words and phrases in Quranic verses.

 <p align="center"> 
 <img src = "https://raw.githubusercontent.com/NoorBayan/Noor/main/image/QVisualization.png" width = "600px"/>
 </p>

#### Treebank

The APIs provide a complete treebank of the Quranic text. This treebank is a manually reviewed treebank that provides a comprehensive representation of the syntactic structure of the All Quranic text.




### Semantic Analysis APIs

In the Semantic Analysis APIs, Noor Platform provides an interactive map that visualizes the relationships between the concepts of the Quran. The concepts are organized in a hierarchical structure, with each main concept having a set of sub-concepts.

 <p align="center"> 
 <img src = "https://raw.githubusercontent.com/NoorBayan/Noor/main/image/QuranicConceptMap.jpg" width = "800px"/>
 </p>

The application interface also provides a story generation service that uses simple and easy language to help children understand the concepts of the Quran.

 <p align="center"> 
 <img src = "https://raw.githubusercontent.com/NoorBayan/Noor/main/image/Story.jpg" width = "800px"/>
 </p>

These sets of APIs are valuable for different research communities, including researchers, developers, and learners.



### APIs 

We use the following notebooks for Noor 

<table class="noor">

  <tr>
    <th class="byan"><b>Name</b></th>
    <th class="byan"><b>Notebook</b></th>
  </tr>
  <tr>
    <td class="byan"> Morphological analysis </td>
    <td class="byan">
    <a href="https://colab.research.google.com/drive/1fRqDemaxeBPo_3fifr4o7uKyGho_9y8n?usp=drive_link">
    <img src="https://colab.research.google.com/assets/colab-badge.svg" >
    </a></td>
  </tr>
  <tr>
    <td class="byan"> Extraction of all different morphological features </td>
    <td class="byan">
    <a href="https://colab.research.google.com/drive/1fRqDemaxeBPo_3fifr4o7uKyGho_9y8n?usp=drive_link">
    <img src="https://colab.research.google.com/assets/colab-badge.svg" >
    </a></td>

  </tr>

  <tr>
    <td class="tg-yw4l"> Dependency-constituency Parsing Representation </td>
    <td class="tg-yw4l">
    <a href="https://colab.research.google.com/drive/1SWn-HwRnyX8Zt4RVbk2qIWjeqV3EU77K?usp=drive_link">
    <img src="https://colab.research.google.com/assets/colab-badge.svg"  >
    </a></td>
  </tr>

  <tr>
    <td class="tg-yw4l">Quran Visualization</td>
    <td class="tg-yw4l">
    <a href="https://colab.research.google.com/drive/1fKwqLa36URBretES59-re6Bkmu1E8hAY?usp=drive_link">
    <img src="https://colab.research.google.com/assets/colab-badge.svg"  >
    </a></td>
  </tr>

  
  <tr>
    <td class="tg-yw4l"> Quranic Treebank Extending </td>
    <td class="tg-yw4l">
    <a href="https://colab.research.google.com/drive/1baA8h04oe-wcVjKpBAMtoHxcpP1J1WIQ?usp=drive_link">
    <img src="https://colab.research.google.com/assets/colab-badge.svg"  >
    </a></td>
  </tr>

  <tr>
    <td class="tg-yw4l"> Extraction of semantic relations </td>
    <td class="tg-yw4l">
    <a href="https://colab.research.google.com/drive/1GVoKSz4eU6urT8Qji64a647GTxykKWhz?usp=sharing">
    <img src="https://colab.research.google.com/assets/colab-badge.svg"  >
    </a></td>
  </tr>

  <tr>
    <td class="tg-yw4l"> Explaining the meanings of Quranic vocabulary </td>
    <td class="tg-yw4l">
    <a href="https://colab.research.google.com/drive/1GVoKSz4eU6urT8Qji64a647GTxykKWhz?usp=sharing">
    <img src="https://colab.research.google.com/assets/colab-badge.svg"  >
    </a></td>
  </tr>

<table>




### Mobile APP 

We developed an Mobile app that interacts with the server




## Citation
pre-prossing

```
@misc{noor2024,
  author = {Wadee Alqubaty, Abdulqadir Alabadi, Asmaa Alshrgabi, Mouhammed kidr},
  title = {Noor: Classical Arabic Treebank Extending},
  title = {Bayan: A Pipeline model for classical Arabic Parsing},
  title = {Quranic: Dataset for Classical Arabic Processing},
  title = {IIrab: A New Visualization of Classical Arabic Grammar},
  year = {2024},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/NoorBayan/}}
}

